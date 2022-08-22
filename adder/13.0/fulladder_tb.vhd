library ieee;
use ieee.std_logic_1164.all;
--
entity fulladder_tb is
end entity;
--
architecture dataflow of fulladder_tb is
component fulladder is 
	port (
				A : in std_logic;
				B : in std_logic;
				Cin : in std_logic;
				Cout : out std_logic;
				Sum : out std_logic
			 );
	end component;
		signal A_tb : std_logic;
		signal B_tb : std_logic;
		signal Cin_tb : std_logic;
		signal Cout_tb : std_logic;
		signal Sum_tb : std_logic;	
	begin	
	DUT : entity work.fulladder
	port map ( 
					A => A_tb,
					B => B_tb,
					Cin => Cin_tb,
					Cout => Cout_tb,
					Sum => Sum_tb
				);
	tb_process : process
	begin
		A_tb <= '0';
		B_tb <= '1';
		Cin_tb <= '0';
		wait for 10 ns;
		--
		Cin_tb <= '1';
		wait for 10 ns;
		--
		A_tb <= '1';
		B_tb <= '0';
		wait for 10 ns;
	end process;
end architecture;
