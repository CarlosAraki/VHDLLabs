-- ES575 - Laboratorio de Circuitos Logicos
-- Laboratorio 10 (Parte III) - Projeto de Maquinas de Estados Temporizadas
-- Aluno: Carlos Vinicius Araki Oliveira - RA:160141
-- Aluno: Cleber Franca Carvalho         - RA:145739


LIBRARY ieee;

USE ieee.std_logic_1164.all;


ENTITY regip IS
	PORT ( Sel,Clk,Clear : IN STD_LOGIC;
				data:in std_logic_vector(8 downto 0);
			q : OUT std_logic_vector(8 downto 0));
	END regip;
ARCHITECTURE Behavior OF regip IS

BEGIN
PROCESS ( Clear,Clk,Sel,data )
 		variable estado:std_logic_vector(8 downto 0):= "000000000";
BEGIN
 			IF (Clear = '1') THEN
 				estado := "000000000" ; --9bits
			elsif(rising_edge(Clk	)) then
 				if(Sel = '1') then 				--se a chave seletora estiver ligada altero o valor
 					estado:=data;
 				end if;
 			END IF ;
 			q<=estado;
 	END PROCESS ;

END Behavior;
