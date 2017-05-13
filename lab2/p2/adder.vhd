LIBRARY	ieee;
USE ieee.std_logic_1164.all;

ENTITY adder IS
	PORT(A: IN STD_LOGIC;
		  B: IN STD_LOGIC;
		  Cin: IN STD_LOGIC;
		  S: OUT STD_LOGIC;
		  Cout: OUT STD_LOGIC
		  );
			
			END adder;

ARCHITECTURE behavior of adder IS

component Mux2_1 IS

	PORT ( x,y,s : IN STD_LOGIC;
			m : OUT STD_LOGIC);
	END component;
	
	SIGNAL P : STD_LOGIC;
	
begin
	P <= (A XOR B);
	S <= (Cin XOR P);
	M0 : Mux2_1 PORT MAP (B,Cin,P,Cout);

end behavior;

	

	
