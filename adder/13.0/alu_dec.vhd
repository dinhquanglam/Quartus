library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
--
entity alu_dec is
port (
			ALUOp : in std_logic;
			Funct_cmd : in std_logic_vector ( 4 downto 1 );
			Funct_s : in std_logic;
			ALUControl : out std_logic_vector ( 1 downto 0 );
			FlagW : out std_logic_vector ( 1 downto 0 )
		);
end entity;
--
architecture behavioral of alu_dec is
signal ALUResult : std_logic_vector ( 1 downto 0) ;
signal tmp : std_logic_vector (1 downto 0 );
begin
	process ( ALUOp, Funct_cmd, Funct_s )
	begin
		if ALUOp = '1' then
			case ( Funct_cmd ) is
				--
				when "0100" => ALUResult <= "00";
					if Funct_s = '0' then tmp <= "00";
					else tmp <= "11";
					end if;
				--
				when "0010" => ALUResult <= "01";
					if Funct_s = '0' then tmp <= "00";
					else tmp <= "11";
					end if;
				--
				when "0000" => ALUResult <= "10";
				if Funct_s = '0' then tmp <= "00";
					else tmp <= "10";
					end if;
				--
				when "1100" => ALUResult <= "11";
				if Funct_s = '0' then tmp <= "00";
					else tmp <= "10";
					end if;
				--
				when others => ALUResult <= "00";
			end case;
		else 
		ALUResult <= "00";
		tmp <= "00";
		end if;
	end process;
	ALuControl <= ALUResult;
	FlagW <= tmp;
end architecture;
			
			