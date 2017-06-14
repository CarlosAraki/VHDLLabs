-- ES575 - Laboratório de Circuitos Lógicos
-- Laboratório 10(Parte III) - Projeto de Máquinas de Estados Temporizadas
-- Aluno: Carlos Vinícius Araki Oliveira - RA:160141
-- Aluno: Cleber França Carvalho         - RA:145739

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY port_n IS
	PORT ( chaves : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			memmoria: in std_logic_vector(15 downto 0);
			sel,Clk,Clear: in STD_LOGIC;
			saida: out std_logic_vector(15 downto 0)
		   );
END port_n;


ARCHITECTURE Behavior OF port_n IS

component reg IS
	PORT (Sel,Clk,Clear : IN STD_LOGIC;
				data:in std_logic_vector(15 downto 0);
			q : OUT std_logic_vector(15 downto 0));
END component;
signal saida1:std_logic_vector(15 downto 0);
BEGIN
	--r1: reg port map('1',Clk,Clear,chaves,saida1);
	saida <=  memmoria WHEN sel = '0'
					ELSE chaves;


END Behavior;
