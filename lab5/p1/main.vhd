library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
entity main is
port ( KEY: in std_LOGIC_VECTOR(1 downto 0);
			SW : in std_LOGIC_VECTOR(7 downto 0);
			LEDR :out std_LOGIC_VECTOR(7 downto 0)
);
end main;
architecture rtl of main is
component counter is
	generic (
		n : natural := 4
	);
	port (
		val_max : in std_LOGIC_VECTOR(n-1 downto 0);
		clock : in STD_LOGIC;
		reset_n : in STD_LOGIC;
		Q : out STD_LOGIC_VECTOR(n-1 downto 0)
		);
end component;
signal clk,res : std_LOGIC;
signal Q,J : std_LOGIC_VECTOR(7 downto 0);
begin
	clk <=  NOT KEY(1);
	res <=   KEY(0);
	J <=  SW;
	eight_bit: counter
		generic map( 8 )
		port map (J,clk, res,Q);
	LEDR(7 downto 0) <= Q;


end rtl;