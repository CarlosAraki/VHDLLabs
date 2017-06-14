-- ES575 - Laboratorio de Circuitos Logicos
-- Laboratorio 10 (Parte III) - Projeto de Maquinas de Estados Temporizadas
-- Aluno: Carlos Vinicius Araki Oliveira - RA:160141
-- Aluno: Cleber Franca Carvalho         - RA:145739

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dec3to8 IS

PORT ( W : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		En : IN STD_LOGIC;
		 Y : OUT STD_LOGIC_VECTOR(0 TO 7));
END dec3to8;

ARCHITECTURE Behavior OF dec3to8 IS

BEGIN
	PROCESS (W, En)
		BEGIN
			IF En = '1' THEN
				CASE W IS
					WHEN "000"=> Y <= "10000000";
					WHEN "001"=> Y <= "01000000";
					WHEN "010"=> Y <= "00100000";
					WHEN "011"=> Y <= "00010000";
					WHEN "100"=> Y <= "00001000";
					WHEN "101"=> Y <= "00000100";
					WHEN "110"=> Y <= "00000010";
					WHEN "111"=> Y <= "00000001";
				  WHEN OTHERS => Y <= "00000000";
				END CASE;
			ELSE
				Y <= "00000000";
			END IF;
	END PROCESS;
END Behavior;
