--
--Nome:Carlos Vinícius Araki Oliveira RA:160141
--Nome:Cleber França Carvalho RA:145739
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY latchq IS
PORT ( D, Clk: IN STD_LOGIC ;
				Q : OUT STD_LOGIC) ;
END latchq ;

ARCHITECTURE Behavior OF latchq IS
BEGIN
	PROCESS ( D, Clk )
		BEGIN
			IF Clk = '1' THEN
				Q <= D ;
			END IF ;
	END PROCESS ;
END Behavior ;