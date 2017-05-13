LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY ffs IS
PORT ( D: IN STD_LOGIC;
		Clk:IN STD_LOGIC;
		Qb: OUT STD_LOGIC);
END ffs;
ARCHITECTURE Structural OF ffs IS

COMPONENT latchq IS
	PORT (  D,Clk : IN STD_LOGIC;
					Q : OUT STD_LOGIC);
		END COMPONENT;

		signal R,c :STD_LOGIC;
		
		BEGIN
		c<=not(Clk);
		M0 : latchq port map(c,D,R);
		M1 : latchq port map(Clk,R,Qb);
END Structural;
