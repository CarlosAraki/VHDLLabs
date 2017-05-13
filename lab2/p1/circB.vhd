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


	COMPONENT char_7seg
	PORT ( C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			Display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	END COMPONENT;
	SIGNAL N :STD_LOGIC_VECTOR(3 DOWNTO 0);
	begin
	
	N <=  "0000" WHEN C ='0'
	ELSE  "0001";
	P0 : char_7seg PORT MAP (N,HEX1);
			
END Behavior;
