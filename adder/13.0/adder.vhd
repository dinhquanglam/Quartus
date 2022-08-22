library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity adder is
generic(
	DATA_WIDTH : integer := 8);
port(
	a: in unsigned(DATA_WIDTH downto 0);
    b: in unsigned(DATA_WIDTH downto 0);
	z: out unsigned(DATA_WIDTH downto 0));
end adder;

architecture dataflow of adder is
begin
	z <= a + b;
end architecture;