library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
--
entity alu_dec_tb is
end entity;
--
architecture dataflow of alu_dec_tb is
component alu_dec_tb is
	port (
				ALUOp : in std_logic;
				Funct_cmd : in std_logic_vector ( 4 downto 1 );
				Funct_s : in std_logic;
				ALUControl : out std_logic_vector ( 1 downto 0 );
				FlagW : out std_logic_vector ( 1 downto 0 )
			);
	end component;
		signal ALUop_tb : std_logic;
		signal Funct_cmd_tb : std_logic_vector ( 4 downto 1 );
		signal Funct_s_tb : std_logic;
		signal ALUControl_tb : std_logic_vector ( 1 downto 0 );
		signal FlagW_tb : std_logic_vector ( 1 downto 0 );
	begin
	DUT : entity work.alu_dec
	port map ( 
					ALUOp => ALUop_tb,
					Funct_cmd => Funct_cmd_tb,
					Funct_s => Funct_s_tb,
					ALUControl => ALUControl_tb,
					FlagW => FlagW_tb
				);
	tb_process : process
	begin
		ALUop_tb <= '0';
		Funct_cmd_tb <= "0100";
		Funct_s_tb <= '0';
		wait for 10 ns;
		--
		ALUop_tb <= '0';
		Funct_cmd_tb <= "0100";
		Funct_s_tb <= '1';
		wait for 10 ns;
		--
		ALUop_tb <= '1';
		Funct_cmd_tb <= "0100";
		Funct_s_tb <= '0';
		wait for 10 ns;
		--
		ALUop_tb <= '1';
		Funct_cmd_tb <= "0100";
		Funct_s_tb <= '1';
		wait for 10 ns;
		--
		ALUop_tb <= '1';
		Funct_cmd_tb <= "0010";
		Funct_s_tb <= '0';
		wait for 10 ns;
		--
		ALUop_tb <= '1';
		Funct_cmd_tb <= "0010";
		Funct_s_tb <= '1';
		wait for 10 ns;
		--
		ALUop_tb <= '1';
		Funct_cmd_tb <= "0000";
		Funct_s_tb <= '0';
		wait for 10 ns;
		--
		ALUop_tb <= '1';
		Funct_cmd_tb <= "0000";
		Funct_s_tb <= '1';
		wait for 10 ns;
		--
		ALUop_tb <= '1';
		Funct_cmd_tb <= "1100";
		Funct_s_tb <= '0';
		wait for 10 ns;
		--
		ALUop_tb <= '1';
		Funct_cmd_tb <= "1100";
		Funct_s_tb <= '1';
		wait for 10 ns;
		--
	end process;
end architecture;