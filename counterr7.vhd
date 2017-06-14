-- ES575 - Laboratório de Circuitos Lógicos
-- Laboratório 10(Parte III) - Projeto de Máquinas de Estados Temporizadas
-- Aluno: Carlos Vinícius Araki Oliveira - RA:160141
-- Aluno: Cleber França Carvalho         - RA:145739

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
ENTITY counterr7 IS
	PORT (incr_pc,R7in,Clk,Clear : IN STD_LOGIC;
				data:in std_logic_vector(15 downto 0);
			q : OUT std_logic_vector(15 downto 0));
	END counterr7;
ARCHITECTURE Behavior OF counterr7 IS

BEGIN
PROCESS (Clear,Clk,incr_pc)
 		variable estado: std_logic_vector(15 downto 0):="0000000000000000";
BEGIN
 			IF (Clear = '1') THEN
 				estado := "0000000000000000" ; --16bits
			elsif(rising_edge(Clk)) then
 				if(incr_pc = '1') then 				--se a chave seletora estiver ligada altero o valor
					estado:=estado+'1';
 				elsif(R7in = '1') then
					estado:=data;
				end if;				
 			END IF ;
 			q<=estado;
 	END PROCESS ;

END Behavior;
