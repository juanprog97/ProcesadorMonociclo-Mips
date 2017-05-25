
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoriaInstrucciones is

	port 
	(
		clock           : in std_logic;
		Address	       : in natural;
		instruccion_out : out std_logic_vector(31 downto 0)
	);

end memoriaInstrucciones;

architecture desarrollo of memoriaInstrucciones is

	-- Build a 2-D array type for the RoM
	subtype instruccion is std_logic_vector(31 downto 0);
	type memoriaInstrucciones is array(0 to 31) of instruccion;

	function init_rom
		return memoriaInstrucciones is 
		variable tmp : memoriaInstrucciones := (others => (others => '0'));
	begin 
		   tmp(0):= "00100100001010000000000000000101"; -- Addi R5 R1 2.
			tmp(1):= "10001100000001000000000000000010"; ---LW R4 R0(2).
			tmp(2):= "10101100000110100000000000000100"; ---SW R26 R0(4).
			tmp(3):= "00000011101111101110000000100000"; ---ADD R28 R29 R30.
		  	tmp(4):= "00001000000000000000000000000111"; ---JUMP 7.
			tmp(7):= "00010001001010100000000000000001"; --- BEQ R9 R10 4.  "No se cumple R9 = 11 Y R10 = 10"	
			tmp(8):= "00100101010010100000000000000001"; --- Addi R10 R10 1.
			tmp(9):= "00010001001010100000000000000001";	--  BEQ R9 R10 1.  " se cumple R9 = 11 Y R10 = 11"	
		return tmp;
	end init_rom;	 

	signal rom : memoriaInstrucciones := init_rom;

begin

	process(clock)
	begin
	if(rising_edge(clock)) then
	end if;
	end process;
	instruccion_out <= rom(Address);

end desarrollo;



