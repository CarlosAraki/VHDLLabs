--
--Nome:Carlos Vinícius Araki Oliveira RA:160141
--Nome:Cleber França Carvalho RA:145739LIBRARY ieee;

USE ieee.std_logic_1164.all;
--Mux2_1

ENTITY Mux2_1 IS
	PORT ( x,y,s : IN STD_LOGIC;
			m : OUT STD_LOGIC);
	END Mux2_1;
ARCHITECTURE Behavior OF Mux2_1 IS
	BEGIN
		m <= (not(s)and x)or(s and y);
END Behavior;