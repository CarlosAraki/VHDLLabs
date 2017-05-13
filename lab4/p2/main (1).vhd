--
--Nome:Carlos Vinícius Araki Oliveira RA:160141
--Nome:Cleber França Carvalho RA:145739
--44 / 149,760 ( < 1 % )


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all ;
ENTITY lab04 IS
PORT ( SW: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		KEY:IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		LEDG: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		HEX0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX2: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX3: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));

END lab04;
ARCHITECTURE Structural OF lab04 IS
component parte33 IS
	PORT
	(
		aclr		: IN STD_LOGIC ;
		clk_en		: IN STD_LOGIC ;
		clock		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END component;
component char_7seg IS
	
	PORT ( C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	
END component;
signal k:STD_logic;
signal s: std_LOGIC_VECTOR(15 downto 0);
begin
	k<= not KEY(0);
	M1: parte33 PORT MAP (SW(0),SW(1),k,s);
	H0: char_7seg PORT MAP(s(3 downto 0),HEX0);
	H1: char_7seg PORT MAP(s(7 downto 4),HEX1);
	H2: char_7seg PORT MAP(s(11 downto 8),HEX2);
	H3: char_7seg PORT MAP(s(15 downto 12),HEX3);
  
END Structural;
