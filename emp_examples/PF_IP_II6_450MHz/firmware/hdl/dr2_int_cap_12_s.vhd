-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dr2_int_cap_12_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    eta1_V : IN STD_LOGIC_VECTOR (9 downto 0);
    phi1_V : IN STD_LOGIC_VECTOR (9 downto 0);
    eta2_V : IN STD_LOGIC_VECTOR (9 downto 0);
    phi2_V : IN STD_LOGIC_VECTOR (9 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (11 downto 0);
    ap_ce : IN STD_LOGIC );
end;


architecture behav of dr2_int_cap_12_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv11_0 : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_const_lv13_835 : STD_LOGIC_VECTOR (12 downto 0) := "0100000110101";
    constant ap_const_lv12_835 : STD_LOGIC_VECTOR (11 downto 0) := "100000110101";

    signal r_V_fu_56_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal r_V_reg_177 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter4 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter5 : BOOLEAN;
    signal ap_block_state7_pp0_stage0_iter6 : BOOLEAN;
    signal ap_block_state8_pp0_stage0_iter7 : BOOLEAN;
    signal ap_block_state9_pp0_stage0_iter8 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal r_V_reg_177_pp0_iter1_reg : STD_LOGIC_VECTOR (10 downto 0);
    signal r_V_3_fu_70_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal r_V_3_reg_184 : STD_LOGIC_VECTOR (10 downto 0);
    signal r_V_3_reg_184_pp0_iter1_reg : STD_LOGIC_VECTOR (10 downto 0);
    signal tmp_fu_76_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_191 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_s_fu_81_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal tmp_s_reg_196 : STD_LOGIC_VECTOR (10 downto 0);
    signal tmp_11_fu_86_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_11_reg_201 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_12_fu_91_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal tmp_12_reg_206 : STD_LOGIC_VECTOR (10 downto 0);
    signal deta_V_fu_96_p3 : STD_LOGIC_VECTOR (10 downto 0);
    signal deta_V_reg_211 : STD_LOGIC_VECTOR (10 downto 0);
    signal dphi_V_fu_101_p3 : STD_LOGIC_VECTOR (10 downto 0);
    signal dphi_V_reg_217 : STD_LOGIC_VECTOR (10 downto 0);
    signal deta_V_cast_fu_106_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal dphi_V_cast_fu_109_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal icmp_fu_126_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_reg_235 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_reg_235_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_reg_235_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_165_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal deta2_V_reg_240 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_171_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal dphi2_V_reg_245 : STD_LOGIC_VECTOR (11 downto 0);
    signal r_V_4_fu_138_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal r_V_4_reg_250 : STD_LOGIC_VECTOR (12 downto 0);
    signal val_assign_fu_144_p3 : STD_LOGIC_VECTOR (12 downto 0);
    signal val_assign_reg_255 : STD_LOGIC_VECTOR (12 downto 0);
    signal tmp_770_fu_150_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_770_reg_260 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_770_reg_260_pp0_iter7_reg : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_15_fu_154_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_15_reg_265 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal lhs_V_fu_48_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal rhs_V_fu_52_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal lhs_V_3_fu_62_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal rhs_V_3_fu_66_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal tmp_13_fu_112_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal tmp_769_fu_116_p4 : STD_LOGIC_VECTOR (4 downto 0);
    signal rhs_V_4_fu_135_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal lhs_V_4_fu_132_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal grp_fu_165_p0 : STD_LOGIC_VECTOR (10 downto 0);
    signal grp_fu_165_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal grp_fu_171_p0 : STD_LOGIC_VECTOR (10 downto 0);
    signal grp_fu_171_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal agg_result_V_fu_159_p3 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_165_ce : STD_LOGIC;
    signal grp_fu_171_ce : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;
    signal eta1_V_int_reg : STD_LOGIC_VECTOR (9 downto 0);
    signal phi1_V_int_reg : STD_LOGIC_VECTOR (9 downto 0);
    signal eta2_V_int_reg : STD_LOGIC_VECTOR (9 downto 0);
    signal phi2_V_int_reg : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_return_int_reg : STD_LOGIC_VECTOR (11 downto 0);

    component mp7wrapped_pfalgobkb IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (10 downto 0);
        din1 : IN STD_LOGIC_VECTOR (10 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (11 downto 0) );
    end component;



begin
    mp7wrapped_pfalgobkb_U38 : component mp7wrapped_pfalgobkb
    generic map (
        ID => 1,
        NUM_STAGE => 2,
        din0_WIDTH => 11,
        din1_WIDTH => 11,
        dout_WIDTH => 12)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_165_p0,
        din1 => grp_fu_165_p1,
        ce => grp_fu_165_ce,
        dout => grp_fu_165_p2);

    mp7wrapped_pfalgobkb_U39 : component mp7wrapped_pfalgobkb
    generic map (
        ID => 1,
        NUM_STAGE => 2,
        din0_WIDTH => 11,
        din1_WIDTH => 11,
        dout_WIDTH => 12)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_171_p0,
        din1 => grp_fu_171_p1,
        ce => grp_fu_171_ce,
        dout => grp_fu_171_p2);





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
                ap_return_int_reg <= agg_result_V_fu_159_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_ce_reg))) then
                deta2_V_reg_240 <= grp_fu_165_p2;
                deta_V_reg_211 <= deta_V_fu_96_p3;
                dphi2_V_reg_245 <= grp_fu_171_p2;
                dphi_V_reg_217 <= dphi_V_fu_101_p3;
                icmp_reg_235 <= icmp_fu_126_p2;
                icmp_reg_235_pp0_iter4_reg <= icmp_reg_235;
                icmp_reg_235_pp0_iter5_reg <= icmp_reg_235_pp0_iter4_reg;
                r_V_3_reg_184 <= r_V_3_fu_70_p2;
                r_V_3_reg_184_pp0_iter1_reg <= r_V_3_reg_184;
                r_V_reg_177 <= r_V_fu_56_p2;
                r_V_reg_177_pp0_iter1_reg <= r_V_reg_177;
                tmp_11_reg_201 <= tmp_11_fu_86_p2;
                tmp_12_reg_206 <= tmp_12_fu_91_p2;
                tmp_15_reg_265 <= tmp_15_fu_154_p2;
                tmp_770_reg_260 <= tmp_770_fu_150_p1;
                tmp_770_reg_260_pp0_iter7_reg <= tmp_770_reg_260;
                tmp_reg_191 <= tmp_fu_76_p2;
                tmp_s_reg_196 <= tmp_s_fu_81_p2;
                val_assign_reg_255 <= val_assign_fu_144_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_ce)) then
                eta1_V_int_reg <= eta1_V;
                eta2_V_int_reg <= eta2_V;
                phi1_V_int_reg <= phi1_V;
                phi2_V_int_reg <= phi2_V;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_reg_235_pp0_iter4_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_ce_reg))) then
                r_V_4_reg_250 <= r_V_4_fu_138_p2;
            end if;
        end if;
    end process;
    agg_result_V_fu_159_p3 <= 
        tmp_770_reg_260_pp0_iter7_reg when (tmp_15_reg_265(0) = '1') else 
        ap_const_lv12_835;
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
        ap_block_state9_pp0_stage0_iter8 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_return_assign_proc : process(agg_result_V_fu_159_p3, ap_ce_reg, ap_return_int_reg)
    begin
        if ((ap_const_logic_0 = ap_ce_reg)) then 
            ap_return <= ap_return_int_reg;
        elsif ((ap_const_logic_1 = ap_ce_reg)) then 
            ap_return <= agg_result_V_fu_159_p3;
        end if; 
    end process;

        deta_V_cast_fu_106_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(deta_V_reg_211),12));

    deta_V_fu_96_p3 <= 
        r_V_reg_177_pp0_iter1_reg when (tmp_reg_191(0) = '1') else 
        tmp_s_reg_196;
        dphi_V_cast_fu_109_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(dphi_V_reg_217),12));

    dphi_V_fu_101_p3 <= 
        r_V_3_reg_184_pp0_iter1_reg when (tmp_11_reg_201(0) = '1') else 
        tmp_12_reg_206;

    grp_fu_165_ce_assign_proc : process(ap_block_pp0_stage0_11001, ap_ce_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_ce_reg))) then 
            grp_fu_165_ce <= ap_const_logic_1;
        else 
            grp_fu_165_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_165_p0 <= deta_V_cast_fu_106_p1(11 - 1 downto 0);
    grp_fu_165_p1 <= deta_V_cast_fu_106_p1(11 - 1 downto 0);

    grp_fu_171_ce_assign_proc : process(ap_block_pp0_stage0_11001, ap_ce_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_ce_reg))) then 
            grp_fu_171_ce <= ap_const_logic_1;
        else 
            grp_fu_171_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_171_p0 <= dphi_V_cast_fu_109_p1(11 - 1 downto 0);
    grp_fu_171_p1 <= dphi_V_cast_fu_109_p1(11 - 1 downto 0);
    icmp_fu_126_p2 <= "1" when (tmp_769_fu_116_p4 = ap_const_lv5_0) else "0";
        lhs_V_3_fu_62_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(phi1_V_int_reg),11));

    lhs_V_4_fu_132_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(deta2_V_reg_240),13));
        lhs_V_fu_48_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(eta1_V_int_reg),11));

    r_V_3_fu_70_p2 <= std_logic_vector(signed(lhs_V_3_fu_62_p1) - signed(rhs_V_3_fu_66_p1));
    r_V_4_fu_138_p2 <= std_logic_vector(unsigned(rhs_V_4_fu_135_p1) + unsigned(lhs_V_4_fu_132_p1));
    r_V_fu_56_p2 <= std_logic_vector(signed(lhs_V_fu_48_p1) - signed(rhs_V_fu_52_p1));
        rhs_V_3_fu_66_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(phi2_V_int_reg),11));

    rhs_V_4_fu_135_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(dphi2_V_reg_245),13));
        rhs_V_fu_52_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(eta2_V_int_reg),11));

    tmp_11_fu_86_p2 <= "1" when (signed(r_V_3_reg_184) > signed(ap_const_lv11_0)) else "0";
    tmp_12_fu_91_p2 <= std_logic_vector(unsigned(ap_const_lv11_0) - unsigned(r_V_3_reg_184));
    tmp_13_fu_112_p2 <= (dphi_V_reg_217 or deta_V_reg_211);
    tmp_15_fu_154_p2 <= "1" when (unsigned(val_assign_reg_255) < unsigned(ap_const_lv13_835)) else "0";
    tmp_769_fu_116_p4 <= tmp_13_fu_112_p2(10 downto 6);
    tmp_770_fu_150_p1 <= val_assign_fu_144_p3(12 - 1 downto 0);
    tmp_fu_76_p2 <= "1" when (signed(r_V_reg_177) > signed(ap_const_lv11_0)) else "0";
    tmp_s_fu_81_p2 <= std_logic_vector(unsigned(ap_const_lv11_0) - unsigned(r_V_reg_177));
    val_assign_fu_144_p3 <= 
        r_V_4_reg_250 when (icmp_reg_235_pp0_iter5_reg(0) = '1') else 
        ap_const_lv13_835;
end behav;
