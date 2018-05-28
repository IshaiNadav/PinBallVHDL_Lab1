-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.0.0 Build 595 04/25/2017 SJ Lite Edition"

-- DATE "05/28/2018 20:52:17"

-- 
-- Device: Altera 5CSXFC6D6F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hp_down_counter IS
    PORT (
	clk : IN std_logic;
	resetN : IN std_logic;
	lives_num_start : IN std_logic_vector(3 DOWNTO 0);
	died : IN std_logic;
	enable : IN std_logic;
	lives_num_current : OUT std_logic_vector(3 DOWNTO 0);
	game_over : OUT std_logic
	);
END hp_down_counter;

-- Design Ports Information
-- lives_num_current[0]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lives_num_current[1]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lives_num_current[2]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lives_num_current[3]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- game_over	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resetN	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lives_num_start[0]	=>  Location: PIN_W24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lives_num_start[1]	=>  Location: PIN_AF29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lives_num_start[2]	=>  Location: PIN_V23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lives_num_start[3]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- died	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- enable	=>  Location: PIN_AF30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF hp_down_counter IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_resetN : std_logic;
SIGNAL ww_lives_num_start : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_died : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL ww_lives_num_current : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_game_over : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \resetN~input_o\ : std_logic;
SIGNAL \lives_num_start[0]~input_o\ : std_logic;
SIGNAL \current_lives_sig[0]~1_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \lives_num_start[3]~input_o\ : std_logic;
SIGNAL \current_lives_sig[3]~13_combout\ : std_logic;
SIGNAL \lives_num_start[2]~input_o\ : std_logic;
SIGNAL \current_lives_sig[2]~9_combout\ : std_logic;
SIGNAL \lives_num_start[1]~input_o\ : std_logic;
SIGNAL \current_lives_sig[1]~5_combout\ : std_logic;
SIGNAL \died~input_o\ : std_logic;
SIGNAL \enable~input_o\ : std_logic;
SIGNAL \current_lives_sig[0]~21_combout\ : std_logic;
SIGNAL \current_lives_sig[1]~7_combout\ : std_logic;
SIGNAL \current_lives_sig[1]~_emulated_q\ : std_logic;
SIGNAL \current_lives_sig[1]~6_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \current_lives_sig[2]~11_combout\ : std_logic;
SIGNAL \current_lives_sig[2]~_emulated_q\ : std_logic;
SIGNAL \current_lives_sig[2]~10_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \current_lives_sig[3]~15_combout\ : std_logic;
SIGNAL \current_lives_sig[3]~_emulated_q\ : std_logic;
SIGNAL \current_lives_sig[3]~14_combout\ : std_logic;
SIGNAL \current_lives_sig[0]~20_combout\ : std_logic;
SIGNAL \current_lives_sig[0]~3_combout\ : std_logic;
SIGNAL \current_lives_sig[0]~_emulated_q\ : std_logic;
SIGNAL \current_lives_sig[0]~2_combout\ : std_logic;
SIGNAL \comb~0_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \game_over$latch~combout\ : std_logic;
SIGNAL \ALT_INV_enable~input_o\ : std_logic;
SIGNAL \ALT_INV_died~input_o\ : std_logic;
SIGNAL \ALT_INV_lives_num_start[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_lives_num_start[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_lives_num_start[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_lives_num_start[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_resetN~input_o\ : std_logic;
SIGNAL \ALT_INV_current_lives_sig[3]~13_combout\ : std_logic;
SIGNAL \ALT_INV_current_lives_sig[2]~9_combout\ : std_logic;
SIGNAL \ALT_INV_current_lives_sig[1]~5_combout\ : std_logic;
SIGNAL \ALT_INV_current_lives_sig[0]~1_combout\ : std_logic;
SIGNAL \ALT_INV_game_over$latch~combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~2_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \ALT_INV_current_lives_sig[0]~21_combout\ : std_logic;
SIGNAL \ALT_INV_current_lives_sig[0]~20_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_comb~0_combout\ : std_logic;
SIGNAL \ALT_INV_current_lives_sig[3]~14_combout\ : std_logic;
SIGNAL \ALT_INV_current_lives_sig[3]~_emulated_q\ : std_logic;
SIGNAL \ALT_INV_current_lives_sig[2]~10_combout\ : std_logic;
SIGNAL \ALT_INV_current_lives_sig[2]~_emulated_q\ : std_logic;
SIGNAL \ALT_INV_current_lives_sig[1]~6_combout\ : std_logic;
SIGNAL \ALT_INV_current_lives_sig[1]~_emulated_q\ : std_logic;
SIGNAL \ALT_INV_current_lives_sig[0]~2_combout\ : std_logic;
SIGNAL \ALT_INV_current_lives_sig[0]~_emulated_q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_resetN <= resetN;
ww_lives_num_start <= lives_num_start;
ww_died <= died;
ww_enable <= enable;
lives_num_current <= ww_lives_num_current;
game_over <= ww_game_over;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_enable~input_o\ <= NOT \enable~input_o\;
\ALT_INV_died~input_o\ <= NOT \died~input_o\;
\ALT_INV_lives_num_start[3]~input_o\ <= NOT \lives_num_start[3]~input_o\;
\ALT_INV_lives_num_start[2]~input_o\ <= NOT \lives_num_start[2]~input_o\;
\ALT_INV_lives_num_start[1]~input_o\ <= NOT \lives_num_start[1]~input_o\;
\ALT_INV_lives_num_start[0]~input_o\ <= NOT \lives_num_start[0]~input_o\;
\ALT_INV_resetN~input_o\ <= NOT \resetN~input_o\;
\ALT_INV_current_lives_sig[3]~13_combout\ <= NOT \current_lives_sig[3]~13_combout\;
\ALT_INV_current_lives_sig[2]~9_combout\ <= NOT \current_lives_sig[2]~9_combout\;
\ALT_INV_current_lives_sig[1]~5_combout\ <= NOT \current_lives_sig[1]~5_combout\;
\ALT_INV_current_lives_sig[0]~1_combout\ <= NOT \current_lives_sig[0]~1_combout\;
\ALT_INV_game_over$latch~combout\ <= NOT \game_over$latch~combout\;
\ALT_INV_Equal0~2_combout\ <= NOT \Equal0~2_combout\;
\ALT_INV_Equal0~1_combout\ <= NOT \Equal0~1_combout\;
\ALT_INV_current_lives_sig[0]~21_combout\ <= NOT \current_lives_sig[0]~21_combout\;
\ALT_INV_current_lives_sig[0]~20_combout\ <= NOT \current_lives_sig[0]~20_combout\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
\ALT_INV_comb~0_combout\ <= NOT \comb~0_combout\;
\ALT_INV_current_lives_sig[3]~14_combout\ <= NOT \current_lives_sig[3]~14_combout\;
\ALT_INV_current_lives_sig[3]~_emulated_q\ <= NOT \current_lives_sig[3]~_emulated_q\;
\ALT_INV_current_lives_sig[2]~10_combout\ <= NOT \current_lives_sig[2]~10_combout\;
\ALT_INV_current_lives_sig[2]~_emulated_q\ <= NOT \current_lives_sig[2]~_emulated_q\;
\ALT_INV_current_lives_sig[1]~6_combout\ <= NOT \current_lives_sig[1]~6_combout\;
\ALT_INV_current_lives_sig[1]~_emulated_q\ <= NOT \current_lives_sig[1]~_emulated_q\;
\ALT_INV_current_lives_sig[0]~2_combout\ <= NOT \current_lives_sig[0]~2_combout\;
\ALT_INV_current_lives_sig[0]~_emulated_q\ <= NOT \current_lives_sig[0]~_emulated_q\;

-- Location: IOOBUF_X89_Y13_N56
\lives_num_current[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \current_lives_sig[0]~2_combout\,
	devoe => ww_devoe,
	o => ww_lives_num_current(0));

-- Location: IOOBUF_X89_Y11_N96
\lives_num_current[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \current_lives_sig[1]~6_combout\,
	devoe => ww_devoe,
	o => ww_lives_num_current(1));

-- Location: IOOBUF_X89_Y11_N45
\lives_num_current[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \current_lives_sig[2]~10_combout\,
	devoe => ww_devoe,
	o => ww_lives_num_current(2));

-- Location: IOOBUF_X89_Y11_N62
\lives_num_current[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \current_lives_sig[3]~14_combout\,
	devoe => ww_devoe,
	o => ww_lives_num_current(3));

-- Location: IOOBUF_X89_Y11_N79
\game_over~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \game_over$latch~combout\,
	devoe => ww_devoe,
	o => ww_game_over);

-- Location: IOIBUF_X89_Y13_N21
\resetN~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_resetN,
	o => \resetN~input_o\);

-- Location: IOIBUF_X89_Y15_N21
\lives_num_start[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lives_num_start(0),
	o => \lives_num_start[0]~input_o\);

-- Location: LABCELL_X88_Y13_N27
\current_lives_sig[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_lives_sig[0]~1_combout\ = ( \resetN~input_o\ & ( \current_lives_sig[0]~1_combout\ ) ) # ( !\resetN~input_o\ & ( \lives_num_start[0]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_lives_num_start[0]~input_o\,
	datad => \ALT_INV_current_lives_sig[0]~1_combout\,
	dataf => \ALT_INV_resetN~input_o\,
	combout => \current_lives_sig[0]~1_combout\);

-- Location: IOIBUF_X89_Y25_N21
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y13_N4
\lives_num_start[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lives_num_start(3),
	o => \lives_num_start[3]~input_o\);

-- Location: LABCELL_X88_Y13_N36
\current_lives_sig[3]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_lives_sig[3]~13_combout\ = ( \lives_num_start[3]~input_o\ & ( (!\resetN~input_o\) # (\current_lives_sig[3]~13_combout\) ) ) # ( !\lives_num_start[3]~input_o\ & ( (\resetN~input_o\ & \current_lives_sig[3]~13_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_resetN~input_o\,
	datad => \ALT_INV_current_lives_sig[3]~13_combout\,
	dataf => \ALT_INV_lives_num_start[3]~input_o\,
	combout => \current_lives_sig[3]~13_combout\);

-- Location: IOIBUF_X89_Y15_N4
\lives_num_start[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lives_num_start(2),
	o => \lives_num_start[2]~input_o\);

-- Location: LABCELL_X88_Y13_N21
\current_lives_sig[2]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_lives_sig[2]~9_combout\ = ( \lives_num_start[2]~input_o\ & ( (!\resetN~input_o\) # (\current_lives_sig[2]~9_combout\) ) ) # ( !\lives_num_start[2]~input_o\ & ( (\resetN~input_o\ & \current_lives_sig[2]~9_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_resetN~input_o\,
	datad => \ALT_INV_current_lives_sig[2]~9_combout\,
	dataf => \ALT_INV_lives_num_start[2]~input_o\,
	combout => \current_lives_sig[2]~9_combout\);

-- Location: IOIBUF_X89_Y15_N38
\lives_num_start[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lives_num_start(1),
	o => \lives_num_start[1]~input_o\);

-- Location: LABCELL_X88_Y13_N24
\current_lives_sig[1]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_lives_sig[1]~5_combout\ = ( \current_lives_sig[1]~5_combout\ & ( (\resetN~input_o\) # (\lives_num_start[1]~input_o\) ) ) # ( !\current_lives_sig[1]~5_combout\ & ( (\lives_num_start[1]~input_o\ & !\resetN~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_lives_num_start[1]~input_o\,
	datad => \ALT_INV_resetN~input_o\,
	dataf => \ALT_INV_current_lives_sig[1]~5_combout\,
	combout => \current_lives_sig[1]~5_combout\);

-- Location: IOIBUF_X89_Y13_N38
\died~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_died,
	o => \died~input_o\);

-- Location: IOIBUF_X89_Y15_N55
\enable~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enable,
	o => \enable~input_o\);

-- Location: LABCELL_X88_Y13_N0
\current_lives_sig[0]~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_lives_sig[0]~21_combout\ = ( \current_lives_sig[1]~6_combout\ & ( \current_lives_sig[0]~2_combout\ & ( (\died~input_o\ & \enable~input_o\) ) ) ) # ( !\current_lives_sig[1]~6_combout\ & ( \current_lives_sig[0]~2_combout\ & ( (\died~input_o\ & 
-- \enable~input_o\) ) ) ) # ( \current_lives_sig[1]~6_combout\ & ( !\current_lives_sig[0]~2_combout\ & ( (\died~input_o\ & \enable~input_o\) ) ) ) # ( !\current_lives_sig[1]~6_combout\ & ( !\current_lives_sig[0]~2_combout\ & ( (\died~input_o\ & 
-- (\enable~input_o\ & ((\current_lives_sig[2]~10_combout\) # (\current_lives_sig[3]~14_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000111000000000000111100000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_lives_sig[3]~14_combout\,
	datab => \ALT_INV_current_lives_sig[2]~10_combout\,
	datac => \ALT_INV_died~input_o\,
	datad => \ALT_INV_enable~input_o\,
	datae => \ALT_INV_current_lives_sig[1]~6_combout\,
	dataf => \ALT_INV_current_lives_sig[0]~2_combout\,
	combout => \current_lives_sig[0]~21_combout\);

-- Location: LABCELL_X88_Y13_N42
\current_lives_sig[1]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_lives_sig[1]~7_combout\ = ( \current_lives_sig[1]~6_combout\ & ( !\current_lives_sig[1]~5_combout\ $ (((!\current_lives_sig[0]~2_combout\ & \current_lives_sig[0]~21_combout\))) ) ) # ( !\current_lives_sig[1]~6_combout\ & ( 
-- !\current_lives_sig[1]~5_combout\ $ (((!\current_lives_sig[0]~21_combout\) # (\current_lives_sig[0]~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110011110011000011001111001111110011000011001111001100001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_current_lives_sig[0]~2_combout\,
	datac => \ALT_INV_current_lives_sig[0]~21_combout\,
	datad => \ALT_INV_current_lives_sig[1]~5_combout\,
	dataf => \ALT_INV_current_lives_sig[1]~6_combout\,
	combout => \current_lives_sig[1]~7_combout\);

-- Location: FF_X88_Y13_N44
\current_lives_sig[1]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \current_lives_sig[1]~7_combout\,
	clrn => \resetN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_lives_sig[1]~_emulated_q\);

-- Location: LABCELL_X88_Y13_N9
\current_lives_sig[1]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_lives_sig[1]~6_combout\ = ( \resetN~input_o\ & ( !\current_lives_sig[1]~5_combout\ $ (!\current_lives_sig[1]~_emulated_q\) ) ) # ( !\resetN~input_o\ & ( \lives_num_start[1]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111101011010010110100101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_lives_sig[1]~5_combout\,
	datac => \ALT_INV_current_lives_sig[1]~_emulated_q\,
	datad => \ALT_INV_lives_num_start[1]~input_o\,
	dataf => \ALT_INV_resetN~input_o\,
	combout => \current_lives_sig[1]~6_combout\);

-- Location: LABCELL_X88_Y13_N45
\Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( !\current_lives_sig[0]~2_combout\ & ( !\current_lives_sig[1]~6_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_lives_sig[1]~6_combout\,
	dataf => \ALT_INV_current_lives_sig[0]~2_combout\,
	combout => \Equal0~1_combout\);

-- Location: LABCELL_X88_Y13_N30
\current_lives_sig[2]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_lives_sig[2]~11_combout\ = ( \current_lives_sig[2]~10_combout\ & ( !\current_lives_sig[2]~9_combout\ $ (((\Equal0~1_combout\ & \current_lives_sig[0]~21_combout\))) ) ) # ( !\current_lives_sig[2]~10_combout\ & ( !\current_lives_sig[2]~9_combout\ $ 
-- (((!\Equal0~1_combout\) # (!\current_lives_sig[0]~21_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111111100000000111111110011111100000000111111110000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Equal0~1_combout\,
	datac => \ALT_INV_current_lives_sig[0]~21_combout\,
	datad => \ALT_INV_current_lives_sig[2]~9_combout\,
	dataf => \ALT_INV_current_lives_sig[2]~10_combout\,
	combout => \current_lives_sig[2]~11_combout\);

-- Location: FF_X88_Y13_N32
\current_lives_sig[2]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \current_lives_sig[2]~11_combout\,
	clrn => \resetN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_lives_sig[2]~_emulated_q\);

-- Location: LABCELL_X88_Y13_N39
\current_lives_sig[2]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_lives_sig[2]~10_combout\ = ( \current_lives_sig[2]~_emulated_q\ & ( (!\resetN~input_o\ & (\lives_num_start[2]~input_o\)) # (\resetN~input_o\ & ((!\current_lives_sig[2]~9_combout\))) ) ) # ( !\current_lives_sig[2]~_emulated_q\ & ( 
-- (!\resetN~input_o\ & (\lives_num_start[2]~input_o\)) # (\resetN~input_o\ & ((\current_lives_sig[2]~9_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010011100100111001001110010011101110010011100100111001001110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_resetN~input_o\,
	datab => \ALT_INV_lives_num_start[2]~input_o\,
	datac => \ALT_INV_current_lives_sig[2]~9_combout\,
	dataf => \ALT_INV_current_lives_sig[2]~_emulated_q\,
	combout => \current_lives_sig[2]~10_combout\);

-- Location: LABCELL_X88_Y13_N6
\Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = ( !\current_lives_sig[0]~2_combout\ & ( (!\current_lives_sig[2]~10_combout\ & !\current_lives_sig[1]~6_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000110000001100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_current_lives_sig[2]~10_combout\,
	datac => \ALT_INV_current_lives_sig[1]~6_combout\,
	dataf => \ALT_INV_current_lives_sig[0]~2_combout\,
	combout => \Equal0~2_combout\);

-- Location: LABCELL_X88_Y13_N12
\current_lives_sig[3]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_lives_sig[3]~15_combout\ = ( \current_lives_sig[3]~14_combout\ & ( !\current_lives_sig[3]~13_combout\ $ (((\Equal0~2_combout\ & \current_lives_sig[0]~21_combout\))) ) ) # ( !\current_lives_sig[3]~14_combout\ & ( !\current_lives_sig[3]~13_combout\ 
-- $ (((!\Equal0~2_combout\) # (!\current_lives_sig[0]~21_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111111100000000111111110011111100000000111111110000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Equal0~2_combout\,
	datac => \ALT_INV_current_lives_sig[0]~21_combout\,
	datad => \ALT_INV_current_lives_sig[3]~13_combout\,
	dataf => \ALT_INV_current_lives_sig[3]~14_combout\,
	combout => \current_lives_sig[3]~15_combout\);

-- Location: FF_X88_Y13_N14
\current_lives_sig[3]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \current_lives_sig[3]~15_combout\,
	clrn => \resetN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_lives_sig[3]~_emulated_q\);

-- Location: LABCELL_X88_Y13_N51
\current_lives_sig[3]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_lives_sig[3]~14_combout\ = ( \current_lives_sig[3]~_emulated_q\ & ( (!\resetN~input_o\ & ((\lives_num_start[3]~input_o\))) # (\resetN~input_o\ & (!\current_lives_sig[3]~13_combout\)) ) ) # ( !\current_lives_sig[3]~_emulated_q\ & ( 
-- (!\resetN~input_o\ & ((\lives_num_start[3]~input_o\))) # (\resetN~input_o\ & (\current_lives_sig[3]~13_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000110111011000100011011101101000100111011100100010011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_resetN~input_o\,
	datab => \ALT_INV_current_lives_sig[3]~13_combout\,
	datad => \ALT_INV_lives_num_start[3]~input_o\,
	dataf => \ALT_INV_current_lives_sig[3]~_emulated_q\,
	combout => \current_lives_sig[3]~14_combout\);

-- Location: LABCELL_X88_Y13_N54
\current_lives_sig[0]~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_lives_sig[0]~20_combout\ = ( \current_lives_sig[1]~6_combout\ & ( \current_lives_sig[0]~2_combout\ & ( (!\died~input_o\) # (!\enable~input_o\) ) ) ) # ( !\current_lives_sig[1]~6_combout\ & ( \current_lives_sig[0]~2_combout\ & ( (!\died~input_o\) 
-- # (!\enable~input_o\) ) ) ) # ( \current_lives_sig[1]~6_combout\ & ( !\current_lives_sig[0]~2_combout\ & ( (\died~input_o\ & \enable~input_o\) ) ) ) # ( !\current_lives_sig[1]~6_combout\ & ( !\current_lives_sig[0]~2_combout\ & ( (\died~input_o\ & 
-- (\enable~input_o\ & ((\current_lives_sig[2]~10_combout\) # (\current_lives_sig[3]~14_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000111000000000000111111111111111100001111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_lives_sig[3]~14_combout\,
	datab => \ALT_INV_current_lives_sig[2]~10_combout\,
	datac => \ALT_INV_died~input_o\,
	datad => \ALT_INV_enable~input_o\,
	datae => \ALT_INV_current_lives_sig[1]~6_combout\,
	dataf => \ALT_INV_current_lives_sig[0]~2_combout\,
	combout => \current_lives_sig[0]~20_combout\);

-- Location: LABCELL_X88_Y13_N48
\current_lives_sig[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_lives_sig[0]~3_combout\ = ( \current_lives_sig[0]~1_combout\ & ( !\current_lives_sig[0]~20_combout\ ) ) # ( !\current_lives_sig[0]~1_combout\ & ( \current_lives_sig[0]~20_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_current_lives_sig[0]~20_combout\,
	dataf => \ALT_INV_current_lives_sig[0]~1_combout\,
	combout => \current_lives_sig[0]~3_combout\);

-- Location: FF_X88_Y13_N50
\current_lives_sig[0]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \current_lives_sig[0]~3_combout\,
	clrn => \resetN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_lives_sig[0]~_emulated_q\);

-- Location: LABCELL_X88_Y13_N15
\current_lives_sig[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_lives_sig[0]~2_combout\ = ( \current_lives_sig[0]~_emulated_q\ & ( (!\resetN~input_o\ & (\lives_num_start[0]~input_o\)) # (\resetN~input_o\ & ((!\current_lives_sig[0]~1_combout\))) ) ) # ( !\current_lives_sig[0]~_emulated_q\ & ( 
-- (!\resetN~input_o\ & (\lives_num_start[0]~input_o\)) # (\resetN~input_o\ & ((\current_lives_sig[0]~1_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101001011111000010100101111101011111000010100101111100001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_resetN~input_o\,
	datac => \ALT_INV_lives_num_start[0]~input_o\,
	datad => \ALT_INV_current_lives_sig[0]~1_combout\,
	dataf => \ALT_INV_current_lives_sig[0]~_emulated_q\,
	combout => \current_lives_sig[0]~2_combout\);

-- Location: LABCELL_X88_Y13_N18
\comb~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb~0_combout\ = ( \current_lives_sig[0]~2_combout\ & ( \resetN~input_o\ ) ) # ( !\current_lives_sig[0]~2_combout\ & ( ((!\current_lives_sig[1]~6_combout\ & (!\current_lives_sig[3]~14_combout\ & !\current_lives_sig[2]~10_combout\))) # (\resetN~input_o\) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101010101010101110101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_resetN~input_o\,
	datab => \ALT_INV_current_lives_sig[1]~6_combout\,
	datac => \ALT_INV_current_lives_sig[3]~14_combout\,
	datad => \ALT_INV_current_lives_sig[2]~10_combout\,
	dataf => \ALT_INV_current_lives_sig[0]~2_combout\,
	combout => \comb~0_combout\);

-- Location: LABCELL_X88_Y13_N33
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( !\current_lives_sig[0]~2_combout\ & ( (!\current_lives_sig[3]~14_combout\ & (!\current_lives_sig[1]~6_combout\ & !\current_lives_sig[2]~10_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_lives_sig[3]~14_combout\,
	datac => \ALT_INV_current_lives_sig[1]~6_combout\,
	datad => \ALT_INV_current_lives_sig[2]~10_combout\,
	dataf => \ALT_INV_current_lives_sig[0]~2_combout\,
	combout => \Equal0~0_combout\);

-- Location: MLABCELL_X87_Y13_N24
\game_over$latch\ : cyclonev_lcell_comb
-- Equation(s):
-- \game_over$latch~combout\ = ( \game_over$latch~combout\ & ( \comb~0_combout\ ) ) # ( !\game_over$latch~combout\ & ( (\comb~0_combout\ & \Equal0~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_comb~0_combout\,
	datac => \ALT_INV_Equal0~0_combout\,
	dataf => \ALT_INV_game_over$latch~combout\,
	combout => \game_over$latch~combout\);

-- Location: LABCELL_X43_Y10_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


