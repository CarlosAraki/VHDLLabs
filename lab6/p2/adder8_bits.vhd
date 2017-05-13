LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder8_bits IS
		PORT ( EN1,EN2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
						COUT: OUT STD_LOGIC;
						SAI : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)); 
END adder8_bits;	
ARCHITECTURE Behavior OF adder8_bits IS
component adder IS
	PORT(A: IN STD_LOGIC;
		  B: IN STD_LOGIC;
		  Cin: IN STD_LOGIC;
		  S: OUT STD_LOGIC;
		  Cout: OUT STD_LOGIC
		  );
		END component;
SIGNAL C1,C2,C3,C4,C5,C6,C7: STD_LOGIC;
	
	BEGIN
	M0: adder PORT MAP(EN1(0),EN2(0),'0',SAI(0),C1);
	M1: adder PORT MAP(EN1(1),EN2(1),C1,SAI(1),C2);
	M2: adder PORT MAP(EN1(2),EN2(2),C2,SAI(2),C3);
	M3: adder PORT MAP(EN1(3),EN2(3),C3,SAI(3),C4);
	M4: adder PORT MAP(EN1(4),EN2(4),C4,SAI(4),C5);
	M5: adder PORT MAP(EN1(5),EN2(5),C5,SAI(5),C6);
	M6: adder PORT MAP(EN1(6),EN2(6),C6,SAI(6),C7);
	M7: adder PORT MAP(EN1(7),EN2(7),C7,SAI(7),COUT);
		
END Behavior;

		
	
