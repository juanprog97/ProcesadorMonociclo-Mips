library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity allu is
	port(
		A	: in  std_logic_vector (31 downto 0);
		B	: in  std_logic_vector (31 downto 0); 
		zero : out std_logic;
		operacion: in  std_logic_vector(1 downto 0);
		Resultado: out std_logic_vector(31 downto 0)
	);
end Entity;


architecture desarrollo of allu is

begin
	process(A,B)
		begin
			case operacion is
				when "00" => 
					Resultado <= A+B;
				when "01" =>
					if(A-B = "00000000000000000000000000000000") then
						zero <= '1';
					else
						zero <= '0';
					end if;
					Resultado <= A-B;
				when "11" =>
					Resultado <= A and B;
				when "10" =>
					Resultado <= A or B;
				when others =>
					Resultado <= "00000000000000000000000000000000";
			end case;
	end process;
end desarrollo;

