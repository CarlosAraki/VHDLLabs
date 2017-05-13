library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity counter is
generic (
	n : natural := 4
);
port (
	val_max : in std_LOGIC_VECTOR(n-1 downto 0);
	clock : in STD_LOGIC;
	reset_n : in STD_LOGIC;
	Q : out STD_LOGIC_VECTOR(n-1 downto 0)
	);
end entity;
architecture rtl of counter is
begin
	PROCESS(val_max,clock, reset_n)
	variable value : std_logic_vector(n-1 downto 0);
	begin
		if (reset_n = '0') then
			value := (OTHERS => '0');
			
		elsif (rising_edge(clock)) then
			value := value + '1';
			IF(value >=  val_max) THEN
				value := (OTHERS => '0');
			end if;
		end if;
	Q <= value;
	end process;
end rtl;