LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
Use ieee.std_logic_unsigned.all;



entity programCounter is
	port
	(
		clock : in STD_LOGIC;
		Pc  :out natural;
		pSource : in  natural
	 );
end programCounter;

architecture description of programCounter IS
	signal Count: natural  := 0;
	
	begin
		Pc <= Count;
		process (clock, pSource)			
		begin
			if (rising_edge(clock)) then
				Count <= pSource;
			end if;
		end process;
end description;



