--
--Nome:Carlos Vinícius Araki Oliveira RA:160141
--Nome:Cleber França Carvalho RA:145739

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY char_7seg IS
	
	PORT ( C : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	
END char_7seg;

ARCHITECTURE Behavior OF char_7seg IS
--. . . modifique aqui
	begin
		Display <=          "0011100" WHEN C= "00" -- Vermelho
							ELSE "0111111" WHEN C="01" -- Amarelo
							ELSE "0100011" WHEN C="10" -- Verde
							ELSE "1111111";
			
END Behavior;
