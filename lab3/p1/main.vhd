LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY lab IS
PORT ( SW: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		KEY:IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		LEDR: OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END lab;
ARCHITECTURE Structural OF lab IS

COMPONENT latchq IS
	PORT ( D,Clk : IN STD_LOGIC;
					Q : OUT STD_LOGIC);
		END COMPONENT;
component ffd IS
PORT ( D: IN STD_LOGIC;
		Clk:IN STD_LOGIC;
		Qb: OUT STD_LOGIC);
		END component;
component ffs IS
PORT ( D: IN STD_LOGIC;
		Clk:IN STD_LOGIC;
		Qb: OUT STD_LOGIC);
END component;

		signal R,c :STD_LOGIC;
		
		BEGIN
	M0 : latchq port map(SW(0),KEY(0),LEDR(0));
	M1 : ffs port map(SW(0),KEY(0),LEDR(1));
	M2 : ffd port map(SW(0),KEY(0),LEDR(2));
END Structural;
