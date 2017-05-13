--Nome:Carlos Vinícius Araki Oliveira RA:160141
--Nome:Cleber França Carvalho RA:145739

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY char_7seg IS
	
	PORT ( C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	
END char_7seg;

ARCHITECTURE Behavior OF char_7seg IS
--. . . modifique aqui
	begin
		Display <=  "1000000" WHEN C= "0000" -- 0
							ELSE "1111001" WHEN C="0001" --1
							ELSE "0100100" WHEN C="0010" --2
							ELSE "0110000" WHEN C="0011" --3
							ELSE "0011001" WHEN C="0100" --4
							ELSE "0010010" WHEN C="0101" --5
							ELSE "0000010" WHEN C="0110" --6
							ELSE "1111000" WHEN C="0111" --7
							ELSE "0000000" WHEN C="1000" --8
							ELSE "0011000" WHEN C="1001"  --9
							ELSE "1111111";
			
END Behavior;
