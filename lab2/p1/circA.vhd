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
	
		S <=  "000" WHEN C ="010"
			ELSE "001" WHEN C="011"
			ELSE "010" WHEN C="100"
			ELSE "011" WHEN C="101"
			ELSE "100" WHEN C="110"
			ELSE "101" WHEN C="111";
					
END Behavior;
