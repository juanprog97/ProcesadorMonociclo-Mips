library ieee;
use ieee.std_logic_1164.all;

entity unidadControl is

	port
	(
		-- Input ports
		instruccion	:in  std_logic_vector(5 downto 0);
		RegDst      :out std_logic;
		branch		:out std_logic;
		memRead     :out std_logic; 
		mentoReg    :out std_logic;
		memWrite    :out std_logic;
		AluOP       :out std_logic_vector(1 downto 0);
		AluSrc      :out std_logic;
		RegWrite    :out std_logic;
		jump        :out std_logic
	);
end unidadControl;

architecture behavior of unidadControl is
begin
	process(instruccion)
	begin
	case instruccion is
			
								
	--ADDiU
		when "001001" =>	RegDst   <= '0';
								branch   <= '0';		
								memRead  <= '0';
								mentoReg <= '0'; 
								memWrite <= '0';
								AluOP    <= "00";
								AluSrc   <= '1';  
								RegWrite <= '1'; 
								jump     <= '0';
			
			
		--Tipo R
		when "000000" =>	RegDst   <= '1';
								branch   <= '0';		
								memRead  <= '0';
								mentoReg <= '0'; 
								memWrite <= '0'; 
								AluOP    <= "10";
								AluSrc   <= '0';   
								RegWrite <= '1';
								jump     <= '0';
			
		--jump
		
		when "000010" =>	
			RegDst   <= '0';
			branch   <= '0';		
			memRead  <= '0';
			mentoReg <= '0'; 
			memWrite <= '0';
			AluOP    <= "00";
			AluSrc   <= '0';    
			RegWrite <= '0';
			jump     <= '1';
		--Lw
		when "100011" =>	
			RegDst   <= '0';
			branch   <= '0';		
			memRead  <= '1';
			mentoReg <= '1'; 
			memWrite <= '0'; 
			AluOP    <= "00";
			AluSrc   <= '1';   
			RegWrite <= '1';
			jump     <= '0';
		--SW
		when "101011" =>	
			RegDst   <= '0';
			branch   <= '0';		
			memRead  <= '0';
			mentoReg <= '0';  
			memWrite <= '1'; 
			AluOP    <= "00";
			AluSrc   <= '1';    
			RegWrite <= '0';
			jump     <= '0';
			
			--BEQ
		when "000100" =>
			RegDst   <= '0';
			branch   <= '1';		
			memRead  <= '0';
			mentoReg <= '0';  
			memWrite <= '0';  
			AluOP    <= "01";
			AluSrc   <= '0';   
			RegWrite <= '0';
			jump     <= '0';
		when others =>
			RegDst   <= '0';
			branch   <= '0';		
			memRead  <= '0';
			mentoReg <= '0';  
			memWrite <= '0';
			AluOP    <= "00";		
			AluSrc   <= '0';    
			RegWrite <= '0';
			jump     <= '0';
		
	end case;
	end process;
		
end behavior;
