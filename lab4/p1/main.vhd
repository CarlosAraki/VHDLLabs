--
--Nome:Carlos Vinícius Araki Oliveira RA:160141
--Nome:Cleber França Carvalho RA:145739
--45 / 149,760 ( < 1 % )


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

component char_7seg IS
	
	PORT ( C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	
END component;
signal k:STD_logic;
signal s: std_LOGIC_VECTOR(15 downto 0);
begin
	k <= NOT KEY(0);
PROCESS(k, SW(0))
  VARIABLE SOMA : std_logic_VECTOR(15 DOWNTO 0) := "0000000000000000";
  BEGIN
    IF (SW(0) = '1') THEN
      SOMA := "0000000000000000";
    ELSIF ( rising_edge(k) ) THEN 
     SOMA := SOMA + '1';
    END IF;
    s <= SOMA;
  END PROCESS;
  H0: char_7seg PORT MAP(s(3 downto 0),HEX0);
  H1: char_7seg PORT MAP(s(7 downto 4),HEX1);
  H2: char_7seg PORT MAP(s(11 downto 8),HEX2);
  H3: char_7seg PORT MAP(s(15 downto 12),HEX3);
  
END Structural;
