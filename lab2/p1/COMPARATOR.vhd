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
		
			s <= 		 '0'   WHEN C= "0000" -- 0
							ELSE '0' WHEN C="0001"  --1
							ELSE '0' WHEN C="0010"  --2
							ELSE '0' WHEN C="0011"  --3
							ELSE '0' WHEN C="0100"  --4
							ELSE '0' WHEN C="0101"  --5
							ELSE '0' WHEN C="0110" --6
							ELSE '0' WHEN C="0111"  --7
							ELSE '0' WHEN C="1000" --8
							ELSE '0' WHEN C="1001"  --9
							ELSE '1' WHEN C="1010"  --10
							ELSE '1' WHEN C="1011" --11
							ELSE '1' WHEN C="1100" --12
							ELSE '1' WHEN C="1101" --13
							ELSE '1' WHEN C="1110" --14
							ELSE '1' WHEN C="1111" ; --15
			
END Behavior;
