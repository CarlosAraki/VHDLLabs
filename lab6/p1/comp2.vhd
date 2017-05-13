Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;


ENTITY comp2 IS
	PORT(
			add_sub: in std_logic;
			A: IN  STD_LOGIC_VECTOR(7 DOWNTO 0); --para o sinal
		   S: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		  );
	END comp2;

ARCHITECTURE behavior of comp2 IS
component Mux2_1 IS
	PORT ( x,y,s : IN STD_LOGIC;
			m : OUT STD_LOGIC);
	END component;
	signal Ab : std_LOGIC_VECTOR(7 DOWNTO 0);
begin
Ab <= not(A)+'1';
M1: Mux2_1 port map(A(0),Ab(0),add_sub,S(0));
M2: Mux2_1 port map(A(1),Ab(1),add_sub,S(1));
M3: Mux2_1 port map(A(2),Ab(2),add_sub,S(2));
M4: Mux2_1 port map(A(3),Ab(3),add_sub,S(3));
M5: Mux2_1 port map(A(4),Ab(4),add_sub,S(4));
M6: Mux2_1 port map(A(5),Ab(5),add_sub,S(5));
M7: Mux2_1 port map(A(6),Ab(6),add_sub,S(6));
M8: Mux2_1 port map(A(7),Ab(7),add_sub,S(7)); 
end behavior;
