library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

--OBS só preciso de um set e um reset para pegar o valor sw 15 ~0 vai para dezenas hora unidade hora dezenas minujtos unidade minutos
entity main is
port ( 
			CLOCK_50:IN STD_LOGIC;
			KEY: in std_LOGIC_VECTOR(1 downto 0);
			SW : in std_LOGIC_VECTOR(15 downto 0); 
			LEDR :out std_LOGIC_VECTOR(7 downto 0);
			HEX7: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX6: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX5: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX4: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX3: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX2: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
end main;
architecture rtl of main is

component char_7seg IS
	
	PORT ( C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	
END component;

component contmega50 IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		s1		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		s2		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		m1		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		m2		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		h1		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		h2		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		h11	: in STD_LOGIC_VECTOR (3 DOWNTO 0);
		h22	: in STD_LOGIC_VECTOR (3 DOWNTO 0);
		m11	: in STD_LOGIC_VECTOR (3 DOWNTO 0);
		m22	: in STD_LOGIC_VECTOR (3 DOWNTO 0);
		set   : in std_LOGIC
		
	);
END component;

signal set: std_LOGIC;
signal s1,s2,m1,m2,h1,h2,h22,h11,m22,m11 : std_LOGIC_VECTOR(3 downto 0);
begin
	set <=   not KEY(0);
	h22<=SW(15 downto 12);
	h11<=SW(11 downto 8);
	m22<=SW(7 downto 4);
	m11<=SW(3 downto 0);


	
q0: contmega50 port map(CLOCK_50,s1,s2,m1,m2,h1,h2,h11,h22,m11,m22,set);
q1: char_7seg port map (s1(3 downto 0),HEX2);	
q2: char_7seg port map (s2(3 downto 0),HEX3);	
q3: char_7seg port map (m1(3 downto 0),HEX4);	
q4: char_7seg port map (m2(3 downto 0),HEX5);	
q5: char_7seg port map (h1(3 downto 0),HEX6);	
q6: char_7seg port map (h2(3 downto 0),HEX7);	

end rtl;