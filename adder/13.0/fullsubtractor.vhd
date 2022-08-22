library ieee;
use ieee.std_logic_1164.all;
---------------------------
entity fullsubtractor is
port (
			A : in std_logic;
			B : in std_logic; 
			Bri : in std_logic;
			D : out std_logic;
			Bro : out std_logic
		);
end entity;
---------------------------
architecture behavioral of fullsubtractor is
begin 

	D <= A xor B xor Bri;
	Bro <= ( not A and B ) or ( not A and Bri ) or ( B and Bri );
	
end architecture;