-- ES575 - Laboratorio de Circuitos Logicos
-- Laboratorio 10 (Parte III) - Projeto de Maquinas de Estados Temporizadas
-- Aluno: Carlos Vinicius Araki Oliveira - RA:160141
-- Aluno: Cleber Franca Carvalho         - RA:145739


LIBRARY ieee;

USE ieee.std_logic_1164.all;


ENTITY reg7bits IS
	PORT (Sel,Clk,Clear : IN STD_LOGIC;
				data:in std_logic_vector(6 downto 0);
			q : OUT std_logic_vector(6 downto 0));
	END reg7bits;
ARCHITECTURE Behavior OF reg7bits IS

BEGIN
PROCESS ( Clear,Clk,Sel,data )
 		variable estado: std_logic_vector(6 downto 0);
BEGIN
 			IF (Clear = '1') THEN
 				estado := "0000000" ; --16bits
			elsif(rising_edge(Clk	)) then
 				if(Sel = '1') then 				--se a chave seletora estiver ligada altero o valor
 					estado:=data;
 				end if;
 			END IF ;
 			q<=estado;
 	END PROCESS ;

END Behavior;
