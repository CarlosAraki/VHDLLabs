--
--Nome:Carlos Vinícius Araki Oliveira RA:160141
--Nome:Cleber França Carvalho RA:145739
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
 		variable estado:std_logic_vector(8 downto 0);
BEGIN
 			IF (Clear = '1') THEN
 				estado := "000000000" ;
			elsif(rising_edge(Clk	)) then
 				if(Sel = '1') then 				--se a chave seletora estiver ligada altero o valor
 					estado:=data;
 				end if;
 			END IF ;
 			q<=estado;
 	END PROCESS ;

END Behavior;
