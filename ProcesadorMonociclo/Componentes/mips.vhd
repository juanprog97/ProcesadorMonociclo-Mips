Library IEEE;
 
Use IEEE.std_logic_1164.all;
Use IEEE.numeric_std.all;


Entity mips is
    Port (
				Clock: in std_logic
			 );
End mips;
 
Architecture proceso of MIPS is



Component programCounter is
    Port (  
			  clock : in STD_LOGIC;
			  Pc  :out natural;
		     pSource : in  natural
			);
End Component;


Component memoriaInstrucciones is
    Port (  
				clock           : in std_logic;
				Address	       : in natural;
				instruccion_out : out std_logic_vector(31 downto 0)
			);
End Component; 
 
Component registrosFicheros is
    Port (
				RegA     : in natural range 0 to 31;
				RegB	   : in natural range 0 to 31;
				WriteReg : in natural range 0 to 31;
				DataIn   : in std_logic_vector(31 downto 0);
				EW       : in std_logic;
				clock    : in std_logic;
				DataOutA : out std_logic_vector(31 downto 0);
				DataOutB : out std_logic_vector(31 downto 0)
			);
End Component;


Component allu is
    Port (  
				A	: in  std_logic_vector (31 downto 0);
				B	: in  std_logic_vector (31 downto 0); 
				zero : out std_logic;
				operacion: in  std_logic_vector(1 downto 0);
				Resultado: out std_logic_vector(31 downto 0)
			);
End Component;
 
Component memoriaRam is
    Port (  
				Address1	: in natural range 0 to 2**12 - 1;
				Data_in	: in std_logic_vector(31 downto 0);
				Wr		   : in std_logic;
				Data_out	: out  std_logic_vector(31 downto 0);
				clock    : in std_logic
			);
End Component;

Component unidadControl is
	Port(
			instruccion	:in  std_logic_vector(5 downto 0);
			RegDst      :out std_logic;
			mentoReg    :out std_logic;
			memWrite    :out std_logic;
			AluOP       :out std_logic_vector(1 downto 0);
			AluSrc      :out std_logic;
			memRead     :out std_logic;
			branch      :out std_logic;
			jump 		   :out std_logic;
			RegWrite    :out std_logic
		  );
		  
End Component;

Component controlAllu is
	Port(
			op	       :  in std_logic_vector(1 downto 0) ;
		   func      :  in std_logic_vector(5 downto 0) ;
		   operacion :  out std_logic_vector(1 downto 0) 
		  );
End Component;


 
Signal DireccionInstruccion: natural;
Signal Instruccion: std_logic_vector(31 downto 0);
Signal DireccionInstruccion_g: std_logic_vector(31 downto 0);
 
Signal InstrucctionSiguiente: std_logic_vector(31 downto 0);
Signal Inmediato: std_logic_vector(31 downto 0);
Signal DireccionSalto: std_logic_vector(31 downto 0);
 
--SeÃƒÂ±ales para de la unidad de Control
Signal regWrite_s : std_logic;
Signal RegDst_s : std_logic; 
Signal AluSrc_s : std_logic;
Signal AluOP_s    : std_logic_vector(1 downto 0);
Signal mentoReg_s : std_logic;
Signal memWrite_s : std_logic;
Signal memRead_s : std_logic;
Signal branch_s : std_logic;
signal jump_s :  std_logic;


--SeÃƒÂ±al de allu
Signal resultado_l: std_logic_vector(31 downto 0);
Signal B_t: std_logic_vector (31 downto 0); 
Signal zero_y : std_logic;


--seÃƒÂ±ales de RegisterFile

Signal salidaA_f : std_logic_vector(31 downto 0);
Signal salidaB_f : std_logic_vector(31 downto 0);
Signal DataIn_t: std_logic_vector(31 downto 0);
Signal WriteReg_t: natural range 0 to 31;

Signal entradaA : natural range 0 to 31;
Signal entradaB : natural range 0 to 31;

--SeÃƒÂ±ales de allu control
Signal operacion_a : std_logic_vector(1 downto 0);

--SeÃƒÂ±ales de memoriaRam

Signal datoMemoria_m: std_logic_vector(31 downto 0);
Signal Adress_ta: natural range 0 to 2**12 - 1;

--Senal program Counter
signal muxPcounter : natural;
signal muxBranch : natural;


signal muxPc : std_logic;
Begin
	process(Clock)
	begin
	if rising_edge(Clock) then
	end if;
	end process;


    inst_programCounter: programCounter Port Map (
        Pc  => DireccionInstruccion ,
		  pSource => muxPcounter,
        clock  => Clock
    );
	 with jump_s select
	 muxPcounter <= to_integer(unsigned(Instruccion(25 downto 0))) when '1',
					    muxBranch when '0',
					    0 when others;
	 
	 with muxPc select
	 muxBranch <= DireccionInstruccion + 1 when '0',
					  to_integer(unsigned(Instruccion(16 downto 0))) when '1',
						0  when others;
	 
	 
	 muxPc <= zero_y and branch_s;
	 

   
	 inst_memoriaInstrucciones: memoriaInstrucciones Port Map(
		   
			Address => DireccionInstruccion ,	   
			instruccion_out => Instruccion,
			clock  => Clock
			
	 );
	 Inmediato <= std_logic_vector(RESIZE(unsigned(Instruccion(15 downto 0)),32));
	 
	 
	 inst_unidadControl: unidadControl Port Map(
			instruccion	=>Instruccion(31 downto 26), 
			RegDst      =>RegDst_s,
			mentoReg    =>mentoReg_s,
			memWrite    =>memWrite_s,
			AluOP       => AluOP_s,
			AluSrc      => AluSrc_s,
			RegWrite    => regWrite_s,
			branch      => branch_s,
			jump  		=> jump_s
			
	 );
	 WriteReg_t <= to_integer(unsigned(Instruccion(20 downto 16))) When RegDst_s = '0' else
					 to_integer(unsigned(Instruccion(15 downto 11)));
	 
	
	 
	 entradaA <= to_integer(unsigned(Instruccion(25 downto 21)));
	 entradaB <= to_integer(unsigned(Instruccion( 20 downto 16)));
	 
	 with mentoReg_s select 
	 DataIn_t <= resultado_l when '0',
					 datoMemoria_m when '1',
					 "00000000000000000000000000000000" when others;
					 
	 inst_registrosFicheros: registrosFicheros Port Map(
			RegA     =>entradaA,
			RegB	   =>entradaB,
			DataIn   =>  DataIn_t,
			WriteReg => WriteReg_t,
			EW       => regWrite_s,
			DataOutA => salidaA_f,
			DataOutB => salidaB_f,
			clock    => Clock
	 );
	  
	 
	 
	 inst_controlAllu : controlAllu Port Map(
		   op	   =>AluOP_s,
		   func  => Instruccion(5 downto 0), 
		   operacion => operacion_a
	 );	
	 
	 With AluSrc_s select
		B_t	<= salidaB_f When '0' ,
			    	Inmediato When '1',
					"00000000000000000000000000000000" when others;
	
	inst_allu : allu Port Map(
		   A => salidaA_f,
			B => B_t,
			zero => zero_y,
			operacion => operacion_a,
			Resultado =>  resultado_l
	 ); 

	 Adress_ta <= to_integer(unsigned(resultado_l));
		
    inst_memoriaRam: memoriaRam Port Map (
			clock  => Clock,
			Address1	=> Adress_ta,
			Data_in	=> salidaB_f,
			Wr		   => memWrite_s,
		   Data_out	=> datoMemoria_m
			
    );
	 


End proceso;