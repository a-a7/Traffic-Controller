-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "06/17/2020 15:42:19"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	trafficController IS
    PORT (
	reset : IN std_logic;
	clock : IN std_logic;
	buttonNS : IN std_logic;
	redNS : OUT std_logic;
	yellowNS : OUT std_logic;
	greenNS : OUT std_logic;
	leftNS : OUT std_logic;
	buttonEW : IN std_logic;
	redEW : OUT std_logic;
	yellowEW : OUT std_logic;
	greenEW : OUT std_logic;
	leftEW : OUT std_logic
	);
END trafficController;

-- Design Ports Information
-- redNS	=>  Location: PIN_B1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- yellowNS	=>  Location: PIN_B2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- greenNS	=>  Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- leftNS	=>  Location: PIN_C1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- redEW	=>  Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- yellowEW	=>  Location: PIN_J3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- greenEW	=>  Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- leftEW	=>  Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- buttonEW	=>  Location: PIN_G3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- buttonNS	=>  Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clock	=>  Location: PIN_G21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF trafficController IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_buttonNS : std_logic;
SIGNAL ww_redNS : std_logic;
SIGNAL ww_yellowNS : std_logic;
SIGNAL ww_greenNS : std_logic;
SIGNAL ww_leftNS : std_logic;
SIGNAL ww_buttonEW : std_logic;
SIGNAL ww_redEW : std_logic;
SIGNAL ww_yellowEW : std_logic;
SIGNAL ww_greenEW : std_logic;
SIGNAL ww_leftEW : std_logic;
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \buttonNS~input_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \redNS~output_o\ : std_logic;
SIGNAL \yellowNS~output_o\ : std_logic;
SIGNAL \greenNS~output_o\ : std_logic;
SIGNAL \leftNS~output_o\ : std_logic;
SIGNAL \redEW~output_o\ : std_logic;
SIGNAL \yellowEW~output_o\ : std_logic;
SIGNAL \greenEW~output_o\ : std_logic;
SIGNAL \leftEW~output_o\ : std_logic;
SIGNAL \buttonEW~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \theState~14_combout\ : std_logic;
SIGNAL \theState.EWR~q\ : std_logic;
SIGNAL \theState~17_combout\ : std_logic;
SIGNAL \theState.NSL~q\ : std_logic;
SIGNAL \theState~16_combout\ : std_logic;
SIGNAL \theState.NSG~q\ : std_logic;
SIGNAL \theState~15_combout\ : std_logic;
SIGNAL \theState.NSY~q\ : std_logic;
SIGNAL \theState~13_combout\ : std_logic;
SIGNAL \theState.NSR~q\ : std_logic;
SIGNAL \theState~11_combout\ : std_logic;
SIGNAL \theState.EWL~q\ : std_logic;
SIGNAL \theState~12_combout\ : std_logic;
SIGNAL \theState.EWG~q\ : std_logic;
SIGNAL \theState~10_combout\ : std_logic;
SIGNAL \theState.EWY~q\ : std_logic;
SIGNAL \redEW~0_combout\ : std_logic;
SIGNAL \redNS~5_combout\ : std_logic;
SIGNAL \redEW~1_combout\ : std_logic;
SIGNAL \ALT_INV_theState.NSL~q\ : std_logic;

BEGIN

ww_reset <= reset;
ww_clock <= clock;
ww_buttonNS <= buttonNS;
redNS <= ww_redNS;
yellowNS <= ww_yellowNS;
greenNS <= ww_greenNS;
leftNS <= ww_leftNS;
ww_buttonEW <= buttonEW;
redEW <= ww_redEW;
yellowEW <= ww_yellowEW;
greenEW <= ww_greenEW;
leftEW <= ww_leftEW;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);
\ALT_INV_theState.NSL~q\ <= NOT \theState.NSL~q\;

-- Location: IOIBUF_X0_Y23_N1
\buttonNS~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttonNS,
	o => \buttonNS~input_o\);

-- Location: IOIBUF_X41_Y15_N1
\clock~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G9
\clock~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~inputclkctrl_outclk\);

-- Location: IOOBUF_X0_Y27_N16
\redNS~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \redNS~5_combout\,
	devoe => ww_devoe,
	o => \redNS~output_o\);

-- Location: IOOBUF_X0_Y27_N9
\yellowNS~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \theState.NSY~q\,
	devoe => ww_devoe,
	o => \yellowNS~output_o\);

-- Location: IOOBUF_X0_Y26_N16
\greenNS~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \theState.NSG~q\,
	devoe => ww_devoe,
	o => \greenNS~output_o\);

-- Location: IOOBUF_X0_Y26_N23
\leftNS~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_theState.NSL~q\,
	devoe => ww_devoe,
	o => \leftNS~output_o\);

-- Location: IOOBUF_X0_Y21_N16
\redEW~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \redEW~1_combout\,
	devoe => ww_devoe,
	o => \redEW~output_o\);

-- Location: IOOBUF_X0_Y21_N23
\yellowEW~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \theState.EWY~q\,
	devoe => ww_devoe,
	o => \yellowEW~output_o\);

-- Location: IOOBUF_X0_Y20_N2
\greenEW~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \theState.EWG~q\,
	devoe => ww_devoe,
	o => \greenEW~output_o\);

-- Location: IOOBUF_X0_Y20_N9
\leftEW~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \theState.EWL~q\,
	devoe => ww_devoe,
	o => \leftEW~output_o\);

-- Location: IOIBUF_X0_Y23_N15
\buttonEW~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttonEW,
	o => \buttonEW~input_o\);

-- Location: IOIBUF_X0_Y21_N8
\reset~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LCCOMB_X1_Y23_N0
\theState~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \theState~14_combout\ = (!\buttonNS~input_o\ & (!\buttonEW~input_o\ & (!\reset~input_o\ & \theState.EWY~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buttonNS~input_o\,
	datab => \buttonEW~input_o\,
	datac => \reset~input_o\,
	datad => \theState.EWY~q\,
	combout => \theState~14_combout\);

-- Location: FF_X1_Y23_N1
\theState.EWR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \theState~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theState.EWR~q\);

-- Location: LCCOMB_X1_Y23_N18
\theState~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \theState~17_combout\ = (!\buttonNS~input_o\ & (!\reset~input_o\ & ((\buttonEW~input_o\) # (!\theState.EWR~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buttonNS~input_o\,
	datab => \buttonEW~input_o\,
	datac => \reset~input_o\,
	datad => \theState.EWR~q\,
	combout => \theState~17_combout\);

-- Location: FF_X1_Y23_N19
\theState.NSL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \theState~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theState.NSL~q\);

-- Location: LCCOMB_X1_Y23_N28
\theState~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \theState~16_combout\ = (!\buttonNS~input_o\ & (!\buttonEW~input_o\ & (!\reset~input_o\ & !\theState.NSL~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buttonNS~input_o\,
	datab => \buttonEW~input_o\,
	datac => \reset~input_o\,
	datad => \theState.NSL~q\,
	combout => \theState~16_combout\);

-- Location: FF_X1_Y23_N29
\theState.NSG\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \theState~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theState.NSG~q\);

-- Location: LCCOMB_X1_Y23_N2
\theState~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \theState~15_combout\ = (!\buttonNS~input_o\ & (!\buttonEW~input_o\ & (!\reset~input_o\ & \theState.NSG~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buttonNS~input_o\,
	datab => \buttonEW~input_o\,
	datac => \reset~input_o\,
	datad => \theState.NSG~q\,
	combout => \theState~15_combout\);

-- Location: FF_X1_Y23_N3
\theState.NSY\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \theState~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theState.NSY~q\);

-- Location: LCCOMB_X1_Y23_N10
\theState~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \theState~13_combout\ = (!\buttonNS~input_o\ & (!\buttonEW~input_o\ & (!\reset~input_o\ & \theState.NSY~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buttonNS~input_o\,
	datab => \buttonEW~input_o\,
	datac => \reset~input_o\,
	datad => \theState.NSY~q\,
	combout => \theState~13_combout\);

-- Location: FF_X1_Y23_N11
\theState.NSR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \theState~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theState.NSR~q\);

-- Location: LCCOMB_X1_Y23_N6
\theState~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \theState~11_combout\ = (!\buttonNS~input_o\ & (!\reset~input_o\ & ((\buttonEW~input_o\) # (\theState.NSR~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buttonNS~input_o\,
	datab => \buttonEW~input_o\,
	datac => \reset~input_o\,
	datad => \theState.NSR~q\,
	combout => \theState~11_combout\);

-- Location: FF_X1_Y23_N7
\theState.EWL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \theState~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theState.EWL~q\);

-- Location: LCCOMB_X1_Y23_N24
\theState~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \theState~12_combout\ = (!\buttonNS~input_o\ & (!\buttonEW~input_o\ & (!\reset~input_o\ & \theState.EWL~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buttonNS~input_o\,
	datab => \buttonEW~input_o\,
	datac => \reset~input_o\,
	datad => \theState.EWL~q\,
	combout => \theState~12_combout\);

-- Location: FF_X1_Y23_N25
\theState.EWG\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \theState~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theState.EWG~q\);

-- Location: LCCOMB_X1_Y23_N12
\theState~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \theState~10_combout\ = (!\buttonNS~input_o\ & (!\buttonEW~input_o\ & (!\reset~input_o\ & \theState.EWG~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buttonNS~input_o\,
	datab => \buttonEW~input_o\,
	datac => \reset~input_o\,
	datad => \theState.EWG~q\,
	combout => \theState~10_combout\);

-- Location: FF_X1_Y23_N13
\theState.EWY\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \theState~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theState.EWY~q\);

-- Location: LCCOMB_X1_Y23_N26
\redEW~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \redEW~0_combout\ = (!\theState.NSR~q\ & !\theState.EWR~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \theState.NSR~q\,
	datad => \theState.EWR~q\,
	combout => \redEW~0_combout\);

-- Location: LCCOMB_X1_Y23_N20
\redNS~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \redNS~5_combout\ = (\theState.EWY~q\) # ((\theState.EWG~q\) # ((\theState.EWL~q\) # (!\redEW~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \theState.EWY~q\,
	datab => \theState.EWG~q\,
	datac => \redEW~0_combout\,
	datad => \theState.EWL~q\,
	combout => \redNS~5_combout\);

-- Location: LCCOMB_X1_Y23_N8
\redEW~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \redEW~1_combout\ = (\theState.NSG~q\) # (((\theState.NSY~q\) # (!\redEW~0_combout\)) # (!\theState.NSL~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \theState.NSG~q\,
	datab => \theState.NSL~q\,
	datac => \redEW~0_combout\,
	datad => \theState.NSY~q\,
	combout => \redEW~1_combout\);

ww_redNS <= \redNS~output_o\;

ww_yellowNS <= \yellowNS~output_o\;

ww_greenNS <= \greenNS~output_o\;

ww_leftNS <= \leftNS~output_o\;

ww_redEW <= \redEW~output_o\;

ww_yellowEW <= \yellowEW~output_o\;

ww_greenEW <= \greenEW~output_o\;

ww_leftEW <= \leftEW~output_o\;
END structure;


