library ieee;
use ieee.std_logic_1164.all;
--------------------------
entity fulladder is
port ( 
			A : in std_logic;
			B : in std_logic;
			Cin : in std_logic;
			Cout : out std_logic;
			Sum : out std_logic
		);
end entity;
----------------------------
architecture behavioral of fulladder is
begin 

	Sum <= A xor B xor Cin;
	Cout <= ( A and B ) or ( A and Cin ) or ( B and Cin );
	
end architecture;
