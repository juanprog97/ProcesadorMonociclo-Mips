-- Quartus II VHDL Template
-- Single port RAM with single read/write address 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity memoriaRam is
	port 
	(
		clock   :in std_logic;
		Address1	: in natural range 0 to 2**12 - 1;
		Data_in	: in std_logic_vector(31 downto 0);
		Wr		: in std_logic;
		Data_out		: out  std_logic_vector(31 downto 0)
	);

end memoriaRam;

architecture memoriaDatos of memoriaRam is


	subtype datos is std_logic_vector(31 downto 0);
	type memoriaRam is array(0 to 4096) of datos;
	signal ram : memoriaRam;


begin
	process(clock)
	begin
	if(falling_edge(clock)) then
		data_out<=ram(Address1);
		if(Wr = '1') then
			ram(Address1) <= Data_in;
		end if;	
	end if;
	end process;
	
	

	
	
End memoriaDatos;





	


