--
--Nome:Carlos Vinícius Araki Oliveira RA:160141
--Nome:Cleber França Carvalho RA:145739
LIBRARY ieee;

USE ieee.std_logic_1164.all;
--Mux2_1

ENTITY Mux2_1_8 IS
	PORT ( x,y : IN STD_LOGIC_vector(7 downto 0);
				s:IN STD_LOGIC;
			m : OUT  STD_LOGIC_vector(7 downto 0));
	END Mux2_1_8;
ARCHITECTURE Behavior OF Mux2_1_8 IS
	
	component Mux2_1 IS
	PORT ( x,y,s : IN STD_LOGIC;
			m : OUT STD_LOGIC);
	END component;
	BEGIN
 Mux1: Mux2_1 port map (x(0),y(0),s,m(0));
 Mux2: Mux2_1 port map (x(1),y(1),s,m(1));
 Mux3: Mux2_1 port map (x(2),y(2),s,m(2));
 Mux4: Mux2_1 port map (x(3),y(3),s,m(3));
 Mux5: Mux2_1 port map (x(4),y(4),s,m(4));
 Mux6: Mux2_1 port map (x(5),y(5),s,m(5));
 Mux7: Mux2_1 port map (x(6),y(6),s,m(6));
 Mux8: Mux2_1 port map (x(7),y(7),s,m(7));
 
END Behavior;