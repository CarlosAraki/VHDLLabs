-- ES575 - Laboratório de Circuitos Lógicos
-- Laboratório 10(Parte III) - Projeto de Máquinas de Estados Temporizadas
-- Aluno: Carlos Vinícius Araki Oliveira - RA:160141
-- Aluno: Cleber França Carvalho         - RA:145739

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY seg7_scroll IS
	PORT (
			sel1,sel2,sel3,sel4,sel5,sel6,sel7,sel8:in std_LOGIC;
			Clk,Clear : IN STD_LOGIC;
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
BEGIN
			R0: reg7bits port map(sel1,Clk,Clear,entrada1,Display0);
			R1: reg7bits port map(sel2,Clk,Clear,entrada1,Display1);
			R2: reg7bits port map(sel3,Clk,Clear,entrada1,Display2);
			R3: reg7bits port map(sel4,Clk,Clear,entrada1,Display3);
			R4: reg7bits port map(sel5,Clk,Clear,entrada1,Display4);
			R5: reg7bits port map(sel6,Clk,Clear,entrada1,Display5);
			R6: reg7bits port map(sel7,Clk,Clear,entrada1,Display6);
			R7: reg7bits port map(sel8,Clk,Clear,entrada1,Display7);
END Behavior;
