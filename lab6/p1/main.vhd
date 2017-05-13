Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

	ENTITY lab6 IS
		PORT ( SW : IN STD_LOGIC_VECTOR(17 DOWNTO 0); -- 8 CIN; 9 SOMA-SUB
			LEDR : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			LEDG : OUT STD_LOGIC_VECTOR (8 DOWNTO 0); 
			KEY: IN STD_LOGIC_VECTOR(1 DOWNTO 0)); 
		END lab6;
	
	
ARCHITECTURE Behavior OF lab6 IS
component adder IS
	PORT(sub: in std_logic;
			clk: in std_LOGIC;
			clear: in std_LOGIC;
		  A: IN  STD_LOGIC_VECTOR(7 DOWNTO 0); --para o sinal
		  B: IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- entrada que ja está na memoria
		  S: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		  );
	END component;
	
	
	signal clk,clear,sub: std_logic;
	signal valore,valors: std_logic_vector(7 DOWNTO 0):="00000000";
	
begin
	clk <=KEY(1);
	clear<=KEY(0);
	sub <= SW(17);
	P1: adder port map (sub,clk,clear,SW(7 DOWNTO 0),valore,valors);
	valore <= valors;
	LEDR <= valors;

END Behavior;	
	
