LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all ;
use ieee.std_logic_arith.all;


ENTITY main IS
		PORT ( SW : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			LEDR : OUT STD_LOGIC_VECTOR (17 DOWNTO 0);
			LEDG : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
			HEX0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX4: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX6: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX7: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			KEY: IN STD_LOGIC_VECTOR(3 DOWNTO 0)); 
			
		END main;
	
	
ARCHITECTURE Behavior OF main IS
component ramlpm IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END component;

component char_7seg IS
	
	PORT ( C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));

END component;

SIGNAL CLKZ,CLKM,CLKR,CLEARREGS,WREN,SELM2,SELM1,SELRB,SELRA,ADDSUBR: std_LOGIC;
SIGNAL DADO,Q: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL EEND: STD_LOGIC_VECTOR(3 DOWNTO 0);
	BEGIN
	DADO <=SW(7 DOWNTO 0);
	EEND <=SW(11 DOWNTO 8);
	WREN <=SW(12);
	SELM2 <= SW(13);
	SELM1 <=SW(14);
	SELRB <=SW(15);
	SELRA <= SW(16);
	ADDSUBR <=SW(17);
	CLKZ <=NOT KEY(0);
	CLKM <=NOT KEY(1);
	CLKR <= NOT KEY(2);
	CLEARREGS <=KEY(3);
	LEDG(0)<=WREN;
	M1: ramlpm port map(EEND,CLKM,DADO,WREN,Q);
	C1: char_7seg port map(Q(3 downto 0),HEX0);
	C2: char_7seg port map(Q(7 downto 4),HEX1);
	C3: char_7seg port map(DADO(3 downto 0),HEX6);
	C4: char_7seg port map(DADO(7 downto 4),HEX7);
	C5: char_7seg port map(EEND,HEX4);
	
END Behavior;

		
	

