-- ES575 - Laboratorio de Circuitos Logicos
-- Laboratorio 10 (Parte III) - Projeto de Maquinas de Estados Temporizadas
-- Aluno: Carlos Vinicius Araki Oliveira - RA:160141
-- Aluno: Cleber Franca Carvalho         - RA:145739


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY regn IS
GENERIC (n : INTEGER := 16);

PORT ( R : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
Rin, Clock : IN STD_LOGIC;
Q : BUFFER STD_LOGIC_VECTOR(n-1 DOWNTO 0));
END regn;

ARCHITECTURE Behavior OF regn IS

BEGIN
	PROCESS (Clock)
		BEGIN
		IF (clock'event and Clock ='1') THEN
			IF Rin = '1' THEN
				Q <= R;
			END IF;
		END IF;
	END PROCESS;
	
END Behavior;
