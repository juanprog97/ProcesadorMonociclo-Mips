library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controlAllu is

	port
	(
		op	       :  in std_logic_vector(1 downto 0) ;
		func      :  in std_logic_vector(5 downto 0) ;
		operacion :  out std_logic_vector(1 downto 0) 
	);
end controlAllu;


architecture behavior of controlAllu is

Signal operacion_t : std_logic_vector(1 downto 0);
 
begin
	process(func)
	begin
		case func is
			when "100000" =>
			operacion_t <= "00";
			when "100010" =>
			operacion_t <= "01";
			when "101000" =>
			operacion_t <= "11";
			when "100101" =>
			operacion_t <= "10";
			when others =>
			operacion_t <= "11";
			end case;
	end process;	
	process(op,operacion_t)
	begin
	case op is
	when "10" =>
		operacion <= operacion_t;
	when "00" =>
	operacion <="00";
	when "01" =>
	operacion <="01";
	when others =>
	operacion <= "00";
	end case;
	end process;
end behavior;
