--
--Nome:Carlos Vinícius Araki Oliveira RA:160141
--Nome:Cleber França Carvalho RA:145739
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;



ENTITY mux10 IS 
	PORT (
			selR:in std_logic_vector(0 to 7);
			Gout,DINOUTx: in STD_LOGIC;
			dentrada,r0,r1,r2,r3,r4,r5,r6,r7,g:in std_logic_vector(15 downto 0);
			q: OUT std_logic_vector(15 downto 0));
	END mux10;
ARCHITECTURE Behavior OF mux10 IS
begin

q <=  r0 WHEN selR(0)= '1' -- 0
					ELSE r1 WHEN selR(1)= '1' --1
					ELSE r2 WHEN selR(2)= '1' --2
					ELSE r3 WHEN selR(3)= '1' --3
					ELSE r4 WHEN selR(4)= '1' --4
					ELSE r5 WHEN selR(5)= '1' --5
					ELSE r6 WHEN selR(6)= '1'--6
					ELSE r7 WHEN selR(7)= '1' --7
					ELSE g WHEN Gout = '1'--8
					ELSE dentrada WHEN DINOUTx = '1' --9
					ELSE "0000000000000000";

END Behavior;
