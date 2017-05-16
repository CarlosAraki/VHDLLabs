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
			HEX2: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX3: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX4: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX5: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX6: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX7: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			KEY: IN STD_LOGIC_VECTOR(3 DOWNTO 0));

		END main;


ARCHITECTURE Behavior OF main IS
component ramlpm IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (3 DOWNTO 0); 					-- endereço do registrador
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);							--informação à ser colocada
		wren		: IN STD_LOGIC ; 																--1 escrita/0 leitura
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0) 								-- saida
	);
END component;

component char_7seg IS

	PORT ( C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));

END component;


component add_sub IS
	PORT
	(
		add_sub		: IN STD_LOGIC ; 	 												--soma ou subtrai
		dataa		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);					-- primeira informação
		datab		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);					-- segunda informação
		overflow		: OUT STD_LOGIC ;												-- overflow
		result		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)				--saida
	);
END component;


component reg IS
	PORT ( Sel,Clk,Clear : IN STD_LOGIC; 									-- chave seletora
				data,dataestatico:in std_logic_vector(7 downto 0); --
			q,dataoutest : OUT std_logic_vector(7 downto 0));
	END component;

component Mux2_1_8 IS
	PORT ( x,y : IN STD_LOGIC_vector(7 downto 0); -- Mux2_1_8
				s:IN STD_LOGIC;
			m : OUT  STD_LOGIC_vector(7 downto 0));
	END component;

SIGNAL CLKZ,CLKM,CLKR,CLEARREGS,WREN,SELM2,SELM1,SELRB,SELRA,ADDSUBR,over: std_LOGIC;
SIGNAL DADO,Q,xa,ras,xb,rbs,Breg,Areg,Zreg,z,G,M: STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
SIGNAL EEND: STD_LOGIC_VECTOR(3 DOWNTO 0);
	BEGIN
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
	--
	M1: ramlpm port map(EEND,CLKM,DADO,WREN,Q);
	RA: reg port map(SELRA,CLKR,CLEARREGS,Q,xa,Areg,ras);
	xa<=ras;
	RB:reg port map(SELRB,CLKR,CLEARREGS,Q,xb,Breg,rbs);
	xb<=rbs;
	Mux8: Mux2_1_8 port map(Areg,Zreg,SELM1,G);
	ADS: add_sub PORT MAP(ADDSUBR,Breg,G,over,M);
	RZ: reg port map('0',CLKZ,CLEARREGS,M,"00000000",Zreg,z);
	Mux9: Mux2_1_8 port map(SW(7 DOWNTO 0),Zreg,SELM2,DADO);
	c1: char_7seg port map(xa(7 downto 4),HEX7);
	c2: char_7seg port map(xa(3 downto 0),HEX6);
	c3: char_7seg port map(xb(7 downto 4),HEX5);
	c4: char_7seg port map(xb(3 downto 0),HEX4);
	c5: char_7seg port map(z(7 downto 4),HEX3);
	c6: char_7seg port map(z(3 downto 0),HEX2);
	c7: char_7seg port map(Q(7 downto 4),HEX1);
	c8: char_7seg port map(Q(3 downto 0),HEX0);

END Behavior;
