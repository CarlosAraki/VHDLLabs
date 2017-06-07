-- ES575 - Laboratório de Circuitos Lógicos
-- Laboratório 10(Parte III) - Projeto de Máquinas de Estados Temporizadas
-- Aluno: Carlos Vinícius Araki Oliveira - RA:160141
-- Aluno: Cleber França Carvalho         - RA:145739

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY port_n IS
	PORT (
				chaves:in std_logic_vector(15 downto 0);
				Clk,Clear,En : IN STD_LOGIC;
	);
END port_n;



ARCHITECTURE Behavior OF port_n IS



BEGIN

END Behavior;
