--
--Nome:Carlos Vinícius Araki Oliveira RA:160141
--Nome:Cleber França Carvalho RA:145739
--44 / 149,760 ( < 1 % )


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all ;
ENTITY main IS
PORT ( 
		CLOCK_50:IN STD_LOGIC;
		HEX0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));

END main;
ARCHITECTURE semmega OF main IS

component char_7seg IS
	
	PORT ( C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	
END component;

component contmega50 IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
END component;

signal J : std_LOGIC_VECTOR(3 downto 0);


begin

m0: contmega50 port map(CLOCK_50,J(3 DOWNTO 0));
M1: char_7seg port map (J(3 downto 0),HEX0);


END semmega;
