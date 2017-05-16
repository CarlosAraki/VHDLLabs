--
--Nome:Carlos Vinícius Araki Oliveira RA:160141
--Nome:Cleber França Carvalho RA:145739
LIBRARY ieee;

USE ieee.std_logic_1164.all;


ENTITY reg IS
	PORT ( Sel,Clk,Clear : IN STD_LOGIC;
				data,dataestatico:in std_logic_vector(7 downto 0);
			q,dataoutest : OUT std_logic_vector(7 downto 0));
	END reg;
ARCHITECTURE Behavior OF reg IS
	
component Mux2_1 IS
	PORT ( x,y,s : IN STD_LOGIC;
			m : OUT STD_LOGIC);
	END component;
	


signal dataentra,datasaida:std_logic_vector(7 downto 0);
	BEGIN
 Mux1: Mux2_1 port map (data(0),dataestatico(0),Sel,dataentra(0));
 Mux2: Mux2_1 port map (data(1),dataestatico(1),Sel,dataentra(1));
 Mux3: Mux2_1 port map (data(2),dataestatico(2),Sel,dataentra(2));
 Mux4: Mux2_1 port map (data(3),dataestatico(3),Sel,dataentra(3));
 Mux5: Mux2_1 port map (data(4),dataestatico(4),Sel,dataentra(4));
 Mux6: Mux2_1 port map (data(5),dataestatico(5),Sel,dataentra(5));
 Mux7: Mux2_1 port map (data(6),dataestatico(6),Sel,dataentra(6));
 Mux8: Mux2_1 port map (data(7),dataestatico(7),Sel,dataentra(7));

 PROCESS ( Clear,dataentra,Clk )
		variable zera:std_logic_vector(7 downto 0):=dataentra;
		BEGIN
			IF (Clear = '1') THEN
				zera := "00000000" ;
			elsif(rising_edge(Clk)) then
			datasaida<=zera;
			END IF ;
			q<=datasaida;
			dataoutest<=datasaida;
	END PROCESS ;

 
	
END Behavior;