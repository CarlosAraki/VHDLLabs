--Nome:Carlos Vinícius Araki Oliveira RA:160141
--Nome:Cleber França Carvalho RA:145739

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY circA IS
	
	PORT ( C : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			 S : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
	
END circA;

ARCHITECTURE Behavior OF circA IS
	begin
	
		S(2) <= C(2) AND C(1);
		S(1) <= NOT(C(1));
		S(0) <= C(0);
 					
END Behavior;
