--Nome:Carlos Vinícius Araki Oliveira RA:160141
--Nome:Cleber França Carvalho RA:145739

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY circB IS
	
	PORT ( C : IN STD_LOGIC;
			 HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
	
END circB;

ARCHITECTURE Behavior OF circB IS


begin
	
	HEX1(6) <= '1';
	HEX1(5) <= C;
	HEX1(4) <= C;
	HEX1(3) <= C;
	HEX1(2) <= '0';
	HEX1(1) <= '0';
	HEX1(0) <= C;

END Behavior;
