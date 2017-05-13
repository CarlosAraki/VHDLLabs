library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

	entity FFD is
	port (
		clock : in STD_LOGIC;
		a_reset : in std_LOGIC;
		D : in STD_LOGIC_VECTOR(9 DOWNTO 0);
		Q : out STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
end entity;

architecture behavior of FFD is

	begin
		process (clock,D)
		VARIABLE SAI:STD_LOGIC_VECTOR(8 DOWNTO 0);
			begin
				if (a_reset = '0') then
					SAI:="000000000";
				elsif (rising_edge(clock)) then 
					IF(D = "0000000000") THEN
						SAI := "000000011";
					ELSif(D = "0000000011")	THEN
						SAI:= "000000101";
					ELSif(D = "0000000101") THEN
						SAI:= "000001001";
					ELSif(D = "0000001001") THEN
						SAI:="000010001";
					ELSif(D ="0000010001") THEN
						SAI:="000010001";
					ELSif(D = "0000100001") THEN
						SAI:="000000011";
					ELSif(D ="0001000001") THEN
						SAI:="000000011";
					ELSIF(D = "0010000001")THEN
						SAI:="000000011";
					ELSIF(D = "0100000001")THEN
						SAI:="000000011";
					
					ELSIF(D ="1000000000") THEN
						SAI:="000100001";
					ELSif(D = "1000000011")	THEN
						SAI:= "000100001";
					ELSif(D = "1000000101") THEN
						SAI:= "000100001";
					ELSif(D = "1000001001") THEN
						SAI:="000100001";
					ELSif(D ="1000010001") THEN
						SAI:="000100001";
					ELSif(D = "1000100001") THEN
						SAI:="001000001";
					ELSif(D ="1001000001") THEN
						SAI:="010000001";
					ELSIF(D = "1010000001")THEN
						SAI:="100000001";
					ELSIF(D = "1100000001")THEN
						SAI:="100000001";					
					END IF;
				end if;
				Q <= SAI;
		end process;
end behavior;