--
--Nome:Carlos Vinícius Araki Oliveira RA:160141
--Nome:Cleber França Carvalho RA:145739
LIBRARY ieee;

USE ieee.std_logic_1164.all;


ENTITY reg IS
	PORT ( Sel,Clk,Clear : IN STD_LOGIC;
				data,dataestatico:in std_logic_vector(7 downto 0);
			q : OUT std_logic_vector(7 downto 0));
	END reg;
ARCHITECTURE Behavior OF reg IS

component Mux2_1_8 IS
	PORT ( x,y : IN STD_LOGIC_vector(7 downto 0); -- Mux2_1_8
				s:IN STD_LOGIC;
			m : OUT  STD_LOGIC_vector(7 downto 0));
	END component;



signal dataentra,datasaida:std_logic_vector(7 downto 0);
	BEGIN
 Mux1: Mux2_1_8 port map (data,dataestatico,Sel,dataentra;
 PROCESS ( Clear,dataentra,Clk )
		variable zera:std_logic_vector(7 downto 0):=dataentra;
		BEGIN
			IF (Clear = '1') THEN
				zera := "00000000" ;
			elsif(rising_edge(Clk	)) then
			datasaida<=zera;
			END IF ;
			q<=datasaida;
	END PROCESS ;



END Behavior;
