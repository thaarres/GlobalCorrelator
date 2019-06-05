import bitstring as bs
import random
import pandas
import numpy as np

def astype(bitarray, t):
  assert isinstance(bitarray, bs.BitArray), "bitarray must be a bitstring.BitArray"
  return getattr(bitarray, t)

class PatternFileDataObj:
  fields = ['Example', 'datavalid']
  lengths = [16, 1]
  types = ['int:16', 'uint:1']

  def __init__(self, data=None, hexstring=None):
    if not data is None and not hexstring is None: 
      raise("Cannot initialise with field data and hexstring simultaneously")
    if not data is None:
      self._data = pandas.DataFrame(data, pandas.Index([0]))
    if not hexstring is None:
      hexdata = bs.BitArray(hexstring)
      d = {}
      for i in range(len(self.fields)):
        l = self.lengths[i]
        ll = sum(self.lengths[:i]) # field offset into 64b hex
        t = self.types[i].split(':')[0]
        d[self.fields[i]] = astype(hexdata[64-ll-l:64-ll], t)
      self._data = pandas.DataFrame(d, pandas.Index([0]))

  def pack(self):
    assert sum(self.lengths) <= 64, "Your data type's fields are longer than 64 bits. You'll have to write your own method to pack them into hex across multiple links / frames"
    fmt_str = ''
    # pad to 64 bits
    if sum(self.lengths) < 64:
      fmt_str += 'uint:' + str(64 - sum(self.lengths)) + ', '
    for fmt in self.types[::-1]:
      fmt_str += fmt + ', '  
    data = np.array(self._data[self.fields].iloc[0]).tolist()[::-1] # reverse the fields
    # the pad field
    if sum(self.lengths) < 64:
      data = [0] + data
    return bs.pack(fmt_str, *data)

  def toVHex(self):
    return str(np.array(self._data['framevalid'])[0]) + 'v' + self.pack().hex

  def data(self):
    return self._data

class PFChargedObj(PatternFileDataObj):
  fields = ['pt', 'eta', 'phi', 'id', 'z0', 'datavalid', 'framevalid']
  lengths = [16, 10, 10, 3, 10, 1, 1]
  types = ['int:16', 'int:10', 'int:10', 'uint:3', 'int:10', 'uint:1', 'uint:1']

def random_PFCharged():
  ''' Make a track with random variables '''
  pt = random.randint(-2**15, 2**15-1)
  eta = random.randint(-2**9, 2**9-1)
  phi = random.randint(-2**9, 2**9-1)
  ID = random.randint(0, 2**3-1)
  z0 = random.randint(-2**9, 2**9-1)
  return PFChargedObj({'pt':pt, 'eta':eta, 'phi':phi, 'id':ID, 'z0':z0, 'datavalid':1, 'framevalid':1})

def header(nlinks):
  txt = 'Board VX\n'
  txt += ' Quad/Chan :'
  for i in range(nlinks):
    #quadstr = '\tq{:02d}c{}'.format(int(i/4), int(i%4))
    quadstr = '        q{:02d}c{}      '.format(int(i/4), int(i%4))
    txt += quadstr
  txt += '\nLink :'
  for i in range(nlinks):
    #txt += '\t{:02d}'.format(i)
    txt += '       {:02d}          '.format(i)
  txt += '\n'
  return txt

def frame(vhexdata, iframe, nlinks):
  assert(len(vhexdata) == nlinks), "Data length doesn't match expected number of links"
  txt = 'Frame {:04d} :'.format(iframe)
  for d in vhexdata:
    txt += ' ' + d
  txt += '\n'
  return txt

def empty_frames(n, istart, nlinks):
  ''' Make n empty frames for nlinks with starting frame number istart '''
  empty_data = '0v0000000000000000'
  empty_frame = [empty_data] * nlinks
  iframe = istart
  frames = []
  for i in range(n):
    frames.append(frame(empty_frame, iframe, nlinks))
    iframe += 1
  return frames

def assignLinksRandom(event, nlinks=36):
  import random
  random.seed(42)
  event['link'] = [random.randint(0, nlinks-1) for i in range(len(event))]
  return event

def eventDataFrameToPatternFile(event, nlinks=72, nframes=108, doheader=True, startframe=0, emptylinks_valid=True):
  '''Write a pattern file for an event dataframe.
  Tracks are assigned to links randomly
  '''
  # Push the tracks for each link into a list
  links = [] 
  startlink = min(event['link'])
  stoplink = max(event['link'])
  empty_link_data = '1' if emptylinks_valid else '0'
  empty_link_data += 'v0000000000000000'
  #empty_data = '1v00000000'
  empty_link = [empty_link_data] * nframes

  # Pad with empty links, if necessary
  for i in range(0, startlink):
      links.append(empty_link)

  # Put the real data on the link
  for i in range(startlink, stoplink+1):
    objs = event[event['link'] == i]
    objs = [PFChargedObj({'pt':o['pt'], 'eta':o['eta'], 'phi':o['phi'], 'id':o['id'], 'z0':o['z0'], 'datavalid':1, 'framevalid':1}).toVHex() for i, o in objs.iterrows()]
    nobjs = len(objs)
    # Pad up to the frame length
    for j in range(nframes - nobjs):
      objs.append('1v0000000000000000')
    links.append(objs)

  # Put empty frames on the remaining links
  for i in range(stoplink+1, nlinks):
    links.append(empty_link)
    
  links = np.array(links)
  frames = links.transpose()
  frames = [frame(f, i+startframe+8, nlinks) for i, f in enumerate(frames)] # +8 because there will be 8 frames of header

  ret = []
  if doheader:
    ret = [header(nlinks)]
  
  return ret + empty_frames(8, startframe, nlinks) + frames# + empty_frames(16, 8 + nframes, 72)

def writepfile(filename, events, nlinks=72, emptylinks_valid=True):
  doheader = True
  startframe = 0
  with open(filename, 'w') as pfile:
    for i, event in enumerate(events):
      if i > 0:
        doheader = False
        startframe += 72 + 8 # The data and inter-event gap
      evframes = eventDataFrameToPatternFile(event, nlinks=nlinks, doheader=doheader, startframe=startframe, emptylinks_valid=emptylinks_valid) 
      for frame in evframes:
        pfile.write(frame)
    for frame in empty_frames(8, startframe + len(evframes), nlinks):
      pfile.write(frame)
    pfile.close()

