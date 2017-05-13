LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY latchd IS
PORT ( Clk, D : IN STD_LOGIC;
					Q : OUT STD_LOGIC);
END latchd;
ARCHITECTURE Structural OF latchd IS
	SIGNAL R_g, S_g, Qa, Qb ,R,S: STD_LOGIC ;

	ATTRIBUTE keep : boolean;

	ATTRIBUTE keep of R_g, S_g, Qa, Qb : SIGNAL IS true;
BEGIN
	S<=D;
	R<= NOT(D);
	R_g <= NOT(R AND Clk);
	S_g <= NOT(S AND Clk);
	Qa <= NOT (S_g AND Qb);
	Qb <= NOT (R_g AND Qa);
	Q <= Qa;
END Structural;
