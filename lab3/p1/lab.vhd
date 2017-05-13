LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY ffds IS
PORT ( D: IN STD_LOGIC;
		Clk:IN STD_LOGIC;
		Qb: OUT STD_LOGIC);
END ffds;
ARCHITECTURE Structural OF ffds IS

COMPONENT latchd IS
	PORT ( Clk, D : IN STD_LOGIC;
					Q : OUT STD_LOGIC);
		END COMPONENT;

		signal R,c :STD_LOGIC;
		
		BEGIN
		c<=not(Clk);
		M0 : latchd port map(c,D,R);
		M1 : latchd port map(Clk,R,Qb);
END Structural;
