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

-- DATE "11/08/2021 22:22:32"

-- 
-- Device: Altera EP2C35F484C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	alu_dec_1 IS
    PORT (
	ALUOp : IN std_logic;
	Funct_cmd : IN std_logic_vector(3 DOWNTO 0);
	Funct_s : IN std_logic;
	ALUControl : OUT std_logic_vector(1 DOWNTO 0);
	FlagW : OUT std_logic_vector(1 DOWNTO 0)
	);
END alu_dec_1;

-- Design Ports Information
-- ALUControl[0]	=>  Location: PIN_AA9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ALUControl[1]	=>  Location: PIN_AB11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- FlagW[0]	=>  Location: PIN_V11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- FlagW[1]	=>  Location: PIN_W11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ALUOp	=>  Location: PIN_T11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Funct_cmd[0]	=>  Location: PIN_R11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Funct_cmd[1]	=>  Location: PIN_AB9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Funct_cmd[2]	=>  Location: PIN_AA11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Funct_cmd[3]	=>  Location: PIN_E11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Funct_s	=>  Location: PIN_AB8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF alu_dec_1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_ALUOp : std_logic;
SIGNAL ww_Funct_cmd : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Funct_s : std_logic;
SIGNAL ww_ALUControl : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_FlagW : std_logic_vector(1 DOWNTO 0);
SIGNAL \tmp[1]~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \ALUOp~combout\ : std_logic;
SIGNAL \ALUResult~0_combout\ : std_logic;
SIGNAL \ALUResult~1_combout\ : std_logic;
SIGNAL \ALUResult~2_combout\ : std_logic;
SIGNAL \ALUResult~3_combout\ : std_logic;
SIGNAL \Funct_s~combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \tmp[1]~0_combout\ : std_logic;
SIGNAL \tmp[1]~0clkctrl_outclk\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL tmp : std_logic_vector(1 DOWNTO 0);
SIGNAL \Funct_cmd~combout\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_ALUOp <= ALUOp;
ww_Funct_cmd <= Funct_cmd;
ww_Funct_s <= Funct_s;
ALUControl <= ww_ALUControl;
FlagW <= ww_FlagW;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\tmp[1]~0clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \tmp[1]~0_combout\);

-- Location: LCCOMB_X30_Y1_N10
\Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\Funct_cmd~combout\(0)) # ((\Funct_cmd~combout\(2) & ((\Funct_cmd~combout\(1)))) # (!\Funct_cmd~combout\(2) & (\Funct_cmd~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct_cmd~combout\(3),
	datab => \Funct_cmd~combout\(0),
	datac => \Funct_cmd~combout\(1),
	datad => \Funct_cmd~combout\(2),
	combout => \Mux2~0_combout\);

-- Location: PIN_E11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Funct_cmd[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Funct_cmd(3),
	combout => \Funct_cmd~combout\(3));

-- Location: PIN_T11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ALUOp~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ALUOp,
	combout => \ALUOp~combout\);

-- Location: PIN_R11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Funct_cmd[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Funct_cmd(0),
	combout => \Funct_cmd~combout\(0));

-- Location: PIN_AB9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Funct_cmd[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Funct_cmd(1),
	combout => \Funct_cmd~combout\(1));

-- Location: PIN_AA11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Funct_cmd[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Funct_cmd(2),
	combout => \Funct_cmd~combout\(2));

-- Location: LCCOMB_X30_Y1_N30
\ALUResult~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ALUResult~0_combout\ = (!\Funct_cmd~combout\(0) & ((\Funct_cmd~combout\(3) & (!\Funct_cmd~combout\(1) & \Funct_cmd~combout\(2))) # (!\Funct_cmd~combout\(3) & (\Funct_cmd~combout\(1) & !\Funct_cmd~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct_cmd~combout\(3),
	datab => \Funct_cmd~combout\(0),
	datac => \Funct_cmd~combout\(1),
	datad => \Funct_cmd~combout\(2),
	combout => \ALUResult~0_combout\);

-- Location: LCCOMB_X30_Y1_N6
\ALUResult~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \ALUResult~1_combout\ = (\ALUOp~combout\ & \ALUResult~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUOp~combout\,
	datad => \ALUResult~0_combout\,
	combout => \ALUResult~1_combout\);

-- Location: LCCOMB_X30_Y1_N16
\ALUResult~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \ALUResult~2_combout\ = (\Funct_cmd~combout\(0)) # ((\Funct_cmd~combout\(1)) # (\Funct_cmd~combout\(3) $ (\Funct_cmd~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct_cmd~combout\(3),
	datab => \Funct_cmd~combout\(0),
	datac => \Funct_cmd~combout\(1),
	datad => \Funct_cmd~combout\(2),
	combout => \ALUResult~2_combout\);

-- Location: LCCOMB_X30_Y1_N4
\ALUResult~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \ALUResult~3_combout\ = (\ALUOp~combout\ & !\ALUResult~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUOp~combout\,
	datac => \ALUResult~2_combout\,
	combout => \ALUResult~3_combout\);

-- Location: PIN_AB8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Funct_s~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Funct_s,
	combout => \Funct_s~combout\);

-- Location: LCCOMB_X30_Y1_N26
\Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\Funct_s~combout\ & ((\Funct_cmd~combout\(1)) # ((!\Funct_cmd~combout\(3) & \Funct_cmd~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Funct_cmd~combout\(3),
	datab => \Funct_cmd~combout\(1),
	datac => \Funct_s~combout\,
	datad => \Funct_cmd~combout\(2),
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X30_Y1_N24
\tmp[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tmp[1]~0_combout\ = (!\Mux2~0_combout\ & \ALUOp~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2~0_combout\,
	datad => \ALUOp~combout\,
	combout => \tmp[1]~0_combout\);

-- Location: CLKCTRL_G13
\tmp[1]~0clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \tmp[1]~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \tmp[1]~0clkctrl_outclk\);

-- Location: LCCOMB_X30_Y1_N20
\tmp[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- tmp(0) = (GLOBAL(\tmp[1]~0clkctrl_outclk\) & (\Mux0~0_combout\)) # (!GLOBAL(\tmp[1]~0clkctrl_outclk\) & ((tmp(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux0~0_combout\,
	datac => tmp(0),
	datad => \tmp[1]~0clkctrl_outclk\,
	combout => tmp(0));

-- Location: LCCOMB_X30_Y1_N22
\Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (!\Funct_cmd~combout\(0) & \Funct_s~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Funct_cmd~combout\(0),
	datac => \Funct_s~combout\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X30_Y1_N18
\tmp[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- tmp(1) = (GLOBAL(\tmp[1]~0clkctrl_outclk\) & (\Mux1~0_combout\)) # (!GLOBAL(\tmp[1]~0clkctrl_outclk\) & ((tmp(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux1~0_combout\,
	datac => tmp(1),
	datad => \tmp[1]~0clkctrl_outclk\,
	combout => tmp(1));

-- Location: PIN_AA9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ALUControl[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ALUResult~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ALUControl(0));

-- Location: PIN_AB11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ALUControl[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ALUResult~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ALUControl(1));

-- Location: PIN_V11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\FlagW[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => tmp(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_FlagW(0));

-- Location: PIN_W11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\FlagW[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => tmp(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_FlagW(1));
END structure;


