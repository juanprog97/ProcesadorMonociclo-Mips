LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity registrosFicheros is
	port
	(
		RegA     : in natural range 0 to 31;
		RegB	   : in natural range 0 to 31;
		WriteReg : in natural range 0 to 31;
		DataIn   : in std_logic_vector(31 downto 0);
		EW       : in std_logic;
		clock    : in std_logic;
		DataOutA : out std_logic_vector(31 downto 0);
		DataOutB : out std_logic_vector(31 downto 0)
	);
end registrosFicheros;

architecture behavior of registrosFicheros is

subtype registro is std_logic_vector(31 downto 0);
type registrosFicheros is array (0 to 31) of registro;

	signal registros: registrosFicheros:=(
		"00000000000000000000000000000000",--0 $zero
		"00000000000000000000000000001000",--1 $at
		"00000000000000000000000000100100",--2 $v0  
		"00000000000000000000000000000000",--3 $v1
		"00000000000000000000000000000000",--4 $a0
		"00000000000000000000000000000000",--5 $a1
		"00000000000000000000000000000000",--6 $a2
		"00000000000000000000000000000000",--7 $a3
		"00000000000000000000000000000000",--8 $t0
		"00000000000000000000000000001011",--9 $t1
		"00000000000000000000000000001010",--10$t2
		"00000000000000000000000000000000",--11$t3 
		"00000000000000000000000000000000",--12$t4
		"00000000000000000000000000000101",--13$t5
		"00000000000000000000000000011000",--14$t6
		"00000000000000000000000000000100",--15$t7
		"00000000000000000000000000000000",--16$s0	
		"00000000000000000000000000000000",--17$s1
		"00000000000000000000000000000000",--18$s2
		"00000000000000000000000000000000",--19$s3
		"00000000000000000000000000000000",--20$s4
		"00000000000000000000000000000000",--21$s5
		"00000000000000000000000000000000",--22$s6
		"00000000000000000000000000000000",--23$s7
		"00000000000000000000000000000000",--24$t8
		"00000000000000000000000000000000",--25$t9
		"00000000000000000000000000011100",--26$k0
		"00000000000000000000000000000000",--27$k1
		"00000000000000000000000000000000",--28$gp
		"00000000000000000000000000000110",--29$sp
		"00000000000000000000000000001000",--30$fp
		"00000000000000000000000000000000"---31$$ra
	) ;

begin
	process (clock)
	begin
		if (rising_edge(clock)) then
			
			if	(EW = '1') then
				registros(writeReg) <= DataIn;
				--if(RegA = writeReg) then
				--	dataOutA <= DataIn;
				--end if;
				--if(RegB = writeReg) then
				--	dataOutB <= DataIn;
			--	end if;
			
			end if;
		end if;
	end process;
	DataOutA <= registros(regA);
	DataOutB <= registros(regB);
	
	
end behavior;


