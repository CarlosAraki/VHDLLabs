LIBRARY ieee;
USE ieee.std_logic_1164.all;

	ENTITY Lab2D IS
		PORT ( SW : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
			LEDR : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
			LEDG : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)); 
		END Lab2D;
	
	
ARCHITECTURE Behavior OF Lab2D IS
component adder IS
	PORT(A: IN STD_LOGIC;
		  B: IN STD_LOGIC;
		  Cin: IN STD_LOGIC;
		  S: OUT STD_LOGIC;
		  Cout: OUT STD_LOGIC
		  );
		END component;
SIGNAL C1,C2,C3: STD_LOGIC;
	
	BEGIN
	LEDR <= SW;
	M0: adder PORT MAP(SW(4),SW(0),SW(8),LEDG(0),C1);
	M1: adder PORT MAP(SW(5),SW(1),C1,LEDG(1),C2);
	M2: adder PORT MAP(SW(6),SW(2),C2,LEDG(2),C3);			
	M3: adder PORT MAP(SW(7),SW(3),C3,LEDG(3),LEDG(4));
	
		
END Behavior;

		
	
