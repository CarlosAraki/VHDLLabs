-- ES575 - Laboratório de Circuitos Lógicos
-- Laboratório 10(Parte III) - Projeto de Máquinas de Estados Temporizadas
-- Aluno: Carlos Vinícius Araki Oliveira - RA:160141
-- Aluno: Cleber França Carvalho         - RA:145739

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY seg7_scroll IS
	PORT (
			sel1:in std_LOGIC;
			Clk,Clear,En : IN STD_LOGIC;
			qualhex:in Std_logic_vector(2 downto 0);
			entrada1:in std_LOGIC_VECTOR(6 downto 0);
			Display0:OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			Display1:OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			Display2:OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			Display3:OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			Display4:OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			Display5:OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			Display6:OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			Display7:OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END seg7_scroll;



ARCHITECTURE Behavior OF seg7_scroll IS

COMPONENT reg7bits IS
	PORT (Sel,Clk,Clear : IN STD_LOGIC;
				data:in std_logic_vector(6 downto 0);
			q : OUT std_logic_vector(6 downto 0));
  	END COMPONENT;
COMPONENT dec3to8 IS

PORT ( W : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		En : IN STD_LOGIC;
		 Y : OUT STD_LOGIC_VECTOR(0 TO 7));
END COMPONENT;

signal saida:std_logic_vector(0 to 7);

BEGIN
			dec: dec3to8 port map(qualhex,En,saida);	
			R0: reg7bits port map(saida(0),Clk,Clear,entrada1,Display0);
			R1: reg7bits port map(saida(1),Clk,Clear,entrada1,Display1);
			R2: reg7bits port map(saida(2),Clk,Clear,entrada1,Display2);
			R3: reg7bits port map(saida(3),Clk,Clear,entrada1,Display3);
			R4: reg7bits port map(saida(4),Clk,Clear,entrada1,Display4);
			R5: reg7bits port map(saida(5),Clk,Clear,entrada1,Display5);
			R6: reg7bits port map(saida(6),Clk,Clear,entrada1,Display6);
			R7: reg7bits port map(saida(7),Clk,Clear,entrada1,Display7);
END Behavior;
