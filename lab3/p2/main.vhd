--
--Nome:Carlos Vinícius Araki Oliveira RA:160141
--Nome:Cleber França Carvalho RA:145739


LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY lab IS
PORT ( SW: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		KEY:IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		LEDG: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		HEX0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX2: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX3: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX4: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX5: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX6: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX7: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));

END lab;
ARCHITECTURE Structural OF lab IS

COMPONENT char_7seg IS
	
	PORT ( C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	
END COMPONENT;


COMPONENT ffs IS
PORT ( D: IN STD_LOGIC;
		Clk:IN STD_LOGIC;
		Qb: OUT STD_LOGIC);
END COMPONENT;

COMPONENT Mux2_1 IS
	PORT ( x,y,s : IN STD_LOGIC;
			m : OUT STD_LOGIC);
	END COMPONENT;


		signal a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,K: STD_LOGIC;
		signal b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15: STD_LOGIC;
		signal V,V1,V2,V3,d : STD_LOGIC_VECTOR(3 DOWNTO 0);
		BEGIN

	K<=not KEY(1);	
	C0: char_7seg port map(SW(3 downto 0),HEX0);	
	C1: char_7seg port map(SW(7 downto 4),HEX1);	
	C2: char_7seg port map(SW(11 downto 8),HEX2);	
	C3: char_7seg port map(SW(15 downto 12),HEX3);	
		--MUX
	O0: Mux2_1 port map(SW(0),'1',K,b0);
	O1: Mux2_1 port map(SW(1),'1',K,b1);
	O2: Mux2_1 port map(SW(2),'1',K,b2);
	O3: Mux2_1 port map(SW(3),'1',K,b3);
	O4: Mux2_1 port map(SW(4),'1',K,b4);
	O5: Mux2_1 port map(SW(5),'1',K,b5);
	O6: Mux2_1 port map(SW(6),'1',K,b6);
	O7: Mux2_1 port map(SW(7),'1',K,b7);
	O8: Mux2_1 port map(SW(8),'1',K,b8);
	O9: Mux2_1 port map(SW(9),'1',K,b9);
	O10: Mux2_1 port map(SW(10),'1',K,b10);
	O11: Mux2_1 port map(SW(11),'1',K,b11);
	O12: Mux2_1 port map(SW(12),'1',K,b12);
	O13: Mux2_1 port map(SW(13),'1',K,b13);
	O14: Mux2_1 port map(SW(14),'1',K,b14);
	O15: Mux2_1 port map(SW(15),'1',K,b15);
	d(0) <= NOT b0;
	d(1) <= NOT b1;
	d(2) <= NOT b2;
	d(3) <= NOT b3;
	
	M0: ffs port map (b0,KEY(0),a0);
	M1: ffs port map (b1,KEY(0),a1);
	M2: ffs port map (b2,KEY(0),a2);
	M3: ffs port map (b3,KEY(0),a3);
	M4: ffs port map (b4,KEY(0),a4);
	M5: ffs port map (b5,KEY(0),a5);
	M6: ffs port map (b6,KEY(0),a6);
	M7: ffs port map (b7,KEY(0),a7);
	M8: ffs port map (b8,KEY(0),a8);
	M9: ffs port map (b9,KEY(0),a9);
	M10: ffs port map (b10,KEY(0),a10);
	M11: ffs port map (b11,KEY(0),a11);
	M12: ffs port map (b12,KEY(0),a12);
	M13: ffs port map (b13,KEY(0),a13);
	M14: ffs port map (b14,KEY(0),a14);
	M15: ffs port map (b15,KEY(0),a15);
		
	
	V(0) <= NOT a0;
	V(1) <= NOT a1;
	V(2) <= NOT a2;
	V(3) <= NOT a3;
	
	C4: char_7seg port map(V(3 downto 0), HEX4);
	V1(0) <= NOT a4;
	V1(1) <= NOT a5;
	V1(2) <= NOT a6;
	V1(3) <= NOT a7;
	C5: char_7seg port map(V1(3 downto 0), HEX5);
	V2(0) <= NOT a8;
	V2(1) <= NOT a9;
	V2(2) <= NOT a10;
	V2(3) <= NOT a11;
	C6: char_7seg port map(V2(3 downto 0), HEX6);
	V3(0) <= NOT a12;
	V3(1) <= NOT a13;
	V3(2) <= NOT a14;
	V3(3) <= NOT a15;
	C7: char_7seg port map(V3(3 downto 0), HEX7);
	
	
	
END Structural;
