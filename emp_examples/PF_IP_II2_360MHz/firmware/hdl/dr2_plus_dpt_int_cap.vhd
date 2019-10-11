-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dr2_plus_dpt_int_cap is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    dr2 : IN STD_LOGIC_VECTOR (13 downto 0);
    pt1_V : IN STD_LOGIC_VECTOR (15 downto 0);
    pt2_V : IN STD_LOGIC_VECTOR (15 downto 0);
    ptscale_V : IN STD_LOGIC_VECTOR (16 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (11 downto 0);
    ap_ce : IN STD_LOGIC );
end;


architecture behav of dr2_plus_dpt_int_cap is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv15_0 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";
    constant ap_const_lv15_16A0 : STD_LOGIC_VECTOR (14 downto 0) := "001011010100000";
    constant ap_const_lv25_1FFFFFF : STD_LOGIC_VECTOR (24 downto 0) := "1111111111111111111111111";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_27 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100111";
    constant ap_const_lv32_13 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010011";
    constant ap_const_lv14_2F4 : STD_LOGIC_VECTOR (13 downto 0) := "00001011110100";
    constant ap_const_lv32_EC4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000111011000100";
    constant ap_const_lv12_EC4 : STD_LOGIC_VECTOR (11 downto 0) := "111011000100";

    signal ptscale_V_read_reg_177 : STD_LOGIC_VECTOR (16 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter4 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter5 : BOOLEAN;
    signal ap_block_state7_pp0_stage0_iter6 : BOOLEAN;
    signal ap_block_state8_pp0_stage0_iter7 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal ptscale_V_read_reg_177_pp0_iter1_reg : STD_LOGIC_VECTOR (16 downto 0);
    signal ptscale_V_read_reg_177_pp0_iter2_reg : STD_LOGIC_VECTOR (16 downto 0);
    signal ptscale_V_read_reg_177_pp0_iter3_reg : STD_LOGIC_VECTOR (16 downto 0);
    signal dr2_read_reg_182 : STD_LOGIC_VECTOR (13 downto 0);
    signal dr2_read_reg_182_pp0_iter1_reg : STD_LOGIC_VECTOR (13 downto 0);
    signal dr2_read_reg_182_pp0_iter2_reg : STD_LOGIC_VECTOR (13 downto 0);
    signal dr2_read_reg_182_pp0_iter3_reg : STD_LOGIC_VECTOR (13 downto 0);
    signal dr2_read_reg_182_pp0_iter4_reg : STD_LOGIC_VECTOR (13 downto 0);
    signal tmp_fu_70_p1 : STD_LOGIC_VECTOR (14 downto 0);
    signal tmp_reg_188 : STD_LOGIC_VECTOR (14 downto 0);
    signal tmp_765_reg_193 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_766_fu_82_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_766_reg_198 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_766_reg_198_pp0_iter1_reg : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_766_reg_198_pp0_iter2_reg : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_766_reg_198_pp0_iter3_reg : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_766_reg_198_pp0_iter4_reg : STD_LOGIC_VECTOR (11 downto 0);
    signal p_s_fu_86_p3 : STD_LOGIC_VECTOR (14 downto 0);
    signal p_s_reg_203 : STD_LOGIC_VECTOR (14 downto 0);
    signal tmp_s_fu_92_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_s_reg_209 : STD_LOGIC_VECTOR (0 downto 0);
    signal dpt2_V_cast_fu_165_p2 : STD_LOGIC_VECTOR (24 downto 0);
    signal dpt2_V_cast_reg_214 : STD_LOGIC_VECTOR (24 downto 0);
    signal p_8_fu_100_p3 : STD_LOGIC_VECTOR (24 downto 0);
    signal p_8_reg_219 : STD_LOGIC_VECTOR (24 downto 0);
    signal r_V_fu_171_p2 : STD_LOGIC_VECTOR (41 downto 0);
    signal r_V_reg_224 : STD_LOGIC_VECTOR (41 downto 0);
    signal dq_fu_133_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal dq_reg_230 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_2_fu_139_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_2_reg_235 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_2_reg_235_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_4_fu_144_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_4_reg_240 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_4_reg_240_pp0_iter6_reg : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_3_fu_149_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_reg_245 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal dpt_V_fu_64_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal dr2_cast1_fu_112_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal phitmp_fu_115_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_88_fu_124_p4 : STD_LOGIC_VECTOR (11 downto 0);
    signal or_cond_fu_154_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal dpt2_V_cast_fu_165_p0 : STD_LOGIC_VECTOR (14 downto 0);
    signal tmp_87_fu_97_p1 : STD_LOGIC_VECTOR (24 downto 0);
    signal dpt2_V_cast_fu_165_p1 : STD_LOGIC_VECTOR (14 downto 0);
    signal r_V_fu_171_p0 : STD_LOGIC_VECTOR (16 downto 0);
    signal r_V_fu_171_p1 : STD_LOGIC_VECTOR (24 downto 0);
    signal agg_result_V_fu_158_p3 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_ce_reg : STD_LOGIC;
    signal dr2_int_reg : STD_LOGIC_VECTOR (13 downto 0);
    signal pt1_V_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal pt2_V_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal ptscale_V_int_reg : STD_LOGIC_VECTOR (16 downto 0);
    signal ap_return_int_reg : STD_LOGIC_VECTOR (11 downto 0);
    signal r_V_fu_171_p00 : STD_LOGIC_VECTOR (41 downto 0);
    signal r_V_fu_171_p10 : STD_LOGIC_VECTOR (41 downto 0);

    component mp7wrapped_pfalgohbi IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (14 downto 0);
        din1 : IN STD_LOGIC_VECTOR (14 downto 0);
        dout : OUT STD_LOGIC_VECTOR (24 downto 0) );
    end component;


    component mp7wrapped_pfalgoibs IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (16 downto 0);
        din1 : IN STD_LOGIC_VECTOR (24 downto 0);
        dout : OUT STD_LOGIC_VECTOR (41 downto 0) );
    end component;



begin
    mp7wrapped_pfalgohbi_U896 : component mp7wrapped_pfalgohbi
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 15,
        din1_WIDTH => 15,
        dout_WIDTH => 25)
    port map (
        din0 => dpt2_V_cast_fu_165_p0,
        din1 => dpt2_V_cast_fu_165_p1,
        dout => dpt2_V_cast_fu_165_p2);

    mp7wrapped_pfalgoibs_U897 : component mp7wrapped_pfalgoibs
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 17,
        din1_WIDTH => 25,
        dout_WIDTH => 42)
    port map (
        din0 => r_V_fu_171_p0,
        din1 => r_V_fu_171_p1,
        dout => r_V_fu_171_p2);





    ap_ce_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            ap_ce_reg <= ap_ce;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_ce_reg)) then
                ap_return_int_reg <= agg_result_V_fu_158_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_ce_reg))) then
                dpt2_V_cast_reg_214 <= dpt2_V_cast_fu_165_p2;
                dq_reg_230 <= dq_fu_133_p2;
                dr2_read_reg_182 <= dr2_int_reg;
                dr2_read_reg_182_pp0_iter1_reg <= dr2_read_reg_182;
                dr2_read_reg_182_pp0_iter2_reg <= dr2_read_reg_182_pp0_iter1_reg;
                dr2_read_reg_182_pp0_iter3_reg <= dr2_read_reg_182_pp0_iter2_reg;
                dr2_read_reg_182_pp0_iter4_reg <= dr2_read_reg_182_pp0_iter3_reg;
                p_8_reg_219 <= p_8_fu_100_p3;
                p_s_reg_203 <= p_s_fu_86_p3;
                ptscale_V_read_reg_177 <= ptscale_V_int_reg;
                ptscale_V_read_reg_177_pp0_iter1_reg <= ptscale_V_read_reg_177;
                ptscale_V_read_reg_177_pp0_iter2_reg <= ptscale_V_read_reg_177_pp0_iter1_reg;
                ptscale_V_read_reg_177_pp0_iter3_reg <= ptscale_V_read_reg_177_pp0_iter2_reg;
                r_V_reg_224 <= r_V_fu_171_p2;
                tmp_2_reg_235 <= tmp_2_fu_139_p2;
                tmp_2_reg_235_pp0_iter6_reg <= tmp_2_reg_235;
                tmp_3_reg_245 <= tmp_3_fu_149_p2;
                tmp_4_reg_240 <= tmp_4_fu_144_p2;
                tmp_4_reg_240_pp0_iter6_reg <= tmp_4_reg_240;
                tmp_765_reg_193 <= dpt_V_fu_64_p2(15 downto 15);
                tmp_766_reg_198 <= tmp_766_fu_82_p1;
                tmp_766_reg_198_pp0_iter1_reg <= tmp_766_reg_198;
                tmp_766_reg_198_pp0_iter2_reg <= tmp_766_reg_198_pp0_iter1_reg;
                tmp_766_reg_198_pp0_iter3_reg <= tmp_766_reg_198_pp0_iter2_reg;
                tmp_766_reg_198_pp0_iter4_reg <= tmp_766_reg_198_pp0_iter3_reg;
                tmp_reg_188 <= tmp_fu_70_p1;
                tmp_s_reg_209 <= tmp_s_fu_92_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_ce)) then
                dr2_int_reg <= dr2;
                pt1_V_int_reg <= pt1_V;
                pt2_V_int_reg <= pt2_V;
                ptscale_V_int_reg <= ptscale_V;
            end if;
        end if;
    end process;
    agg_result_V_fu_158_p3 <= 
        tmp_4_reg_240_pp0_iter6_reg when (or_cond_fu_154_p2(0) = '1') else 
        ap_const_lv12_EC4;
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter4 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage0_iter5 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state7_pp0_stage0_iter6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state8_pp0_stage0_iter7 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_return_assign_proc : process(agg_result_V_fu_158_p3, ap_ce_reg, ap_return_int_reg)
    begin
        if ((ap_const_logic_0 = ap_ce_reg)) then 
            ap_return <= ap_return_int_reg;
        elsif ((ap_const_logic_1 = ap_ce_reg)) then 
            ap_return <= agg_result_V_fu_158_p3;
        end if; 
    end process;

    dpt2_V_cast_fu_165_p0 <= tmp_87_fu_97_p1(15 - 1 downto 0);
    dpt2_V_cast_fu_165_p1 <= tmp_87_fu_97_p1(15 - 1 downto 0);
    dpt_V_fu_64_p2 <= std_logic_vector(unsigned(pt1_V_int_reg) - unsigned(pt2_V_int_reg));
    dq_fu_133_p2 <= std_logic_vector(unsigned(dr2_cast1_fu_112_p1) + unsigned(phitmp_fu_115_p4));
    dr2_cast1_fu_112_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(dr2_read_reg_182_pp0_iter4_reg),32));
    or_cond_fu_154_p2 <= (tmp_3_reg_245 and tmp_2_reg_235_pp0_iter6_reg);
    p_8_fu_100_p3 <= 
        ap_const_lv25_1FFFFFF when (tmp_s_reg_209(0) = '1') else 
        dpt2_V_cast_reg_214;
    p_s_fu_86_p3 <= 
        ap_const_lv15_0 when (tmp_765_reg_193(0) = '1') else 
        tmp_reg_188;
    phitmp_fu_115_p4 <= r_V_reg_224(39 downto 8);
    r_V_fu_171_p0 <= r_V_fu_171_p00(17 - 1 downto 0);
    r_V_fu_171_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ptscale_V_read_reg_177_pp0_iter3_reg),42));
    r_V_fu_171_p1 <= r_V_fu_171_p10(25 - 1 downto 0);
    r_V_fu_171_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_8_reg_219),42));
    tmp_2_fu_139_p2 <= "1" when (unsigned(dr2_read_reg_182_pp0_iter4_reg) < unsigned(ap_const_lv14_2F4)) else "0";
    tmp_3_fu_149_p2 <= "1" when (signed(dq_reg_230) < signed(ap_const_lv32_EC4)) else "0";
    tmp_4_fu_144_p2 <= std_logic_vector(unsigned(tmp_766_reg_198_pp0_iter4_reg) + unsigned(tmp_88_fu_124_p4));
    tmp_766_fu_82_p1 <= dr2_int_reg(12 - 1 downto 0);
    tmp_87_fu_97_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_s_reg_203),25));
    tmp_88_fu_124_p4 <= r_V_reg_224(19 downto 8);
    tmp_fu_70_p1 <= dpt_V_fu_64_p2(15 - 1 downto 0);
    tmp_s_fu_92_p2 <= "1" when (unsigned(p_s_reg_203) > unsigned(ap_const_lv15_16A0)) else "0";
end behav;
