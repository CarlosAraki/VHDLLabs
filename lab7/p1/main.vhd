library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

	entity main is
	port (
			KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			SW : IN STD_LOGIC_VECTOR (1 downto 0);
			LEDG: OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
			LEDR : OUT STD_LOGIC_VECTOR (8 DOWNTO 0)
	);
end main;

architecture behavior of main is
COMPONENT FFD is
	port (
		clock : in STD_LOGIC;
		a_reset : in std_LOGIC;
		D : in STD_LOGIC_VECTOR(9 DOWNTO 0);
		Q : out STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
end COMPONENT;

SIGNAL ENT : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL ESTADO: STD_LOGIC_VECTOR(8 DOWNTO 0):="000000000";

begin
		ENT(9)<=SW(0);
		ENT(8 DOWNTO 0)<= ESTADO;
		F0: FFD PORT MAP(NOT(KEY(1)),KEY(0),ENT,ESTADO);
		LEDG(8) <= (ESTADO(0) AND ESTADO(8)) OR (ESTADO(0) AND ESTADO(4));
		LEDR<= ESTADO;

end behavior;