--Nome:Carlos Vinícius Araki Oliveira RA:160141
--Nome:Cleber França Carvalho RA:145739

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY COMPARATOR IS
	
	PORT ( C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			 s: OUT STD_LOGIC);
	
END COMPARATOR;

ARCHITECTURE Behavior OF COMPARATOR IS
	begin
		
			s <= (C(3)and C(1))or(C(3)and C(2));
			
END Behavior;
