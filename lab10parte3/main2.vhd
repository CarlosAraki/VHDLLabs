-- ES575 - Laboratório de Circuitos Lógicos
-- Laboratório 10(Parte III) - Projeto de Máquinas de Estados Temporizadas
-- Aluno: Carlos Vinícius Araki Oliveira - RA:160141
-- Aluno: Cleber França Carvalho         - RA:145739

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY main2 IS
	PORT (
				Clock,Resetn,Run:in STD_LOGIC;
				LEDR : out std_logic_vector(15 downto 0);
				Done: out STD_LOGIC);
END main2;



ARCHITECTURE Behavior OF main2 IS
component PROC IS
	PORT ( DIN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			Addrout,Dout: out STD_LOGIC_VECTOR(15 DOWNTO 0);
		   Resetn, Clock, Run : IN STD_LOGIC;
			 Addrstall,W_D : out STD_LOGIC;
			Done: BUFFER STD_LOGIC);
END component;

component memRAM
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		addressstall_a		: IN STD_LOGIC  := '0';
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
end component;

COMPONENT reg IS											--COMPONENT
	PORT ( Sel,Clk,Clear : IN STD_LOGIC;
			data:in std_logic_vector(15 downto 0);
			q : OUT std_logic_vector(15 downto 0));
	END COMPONENT;


signal auxend,DINN,AddroutT,DoutT: std_logic_vector(15 downto 0);
signal notstall,addstall,W_DD,Wren,por,sor,E: STD_LOGIC;


BEGIN
	proc1: PROC port map(DINN,AddroutT,DoutT,Resetn,Clock,Run,addstall,W_DD,Done);
	memoria: memRAM port map(AddroutT(6 downto 0),addstall,Clock,DoutT,Wren,DINN);
	por<= not(auxend(15) or auxend(14) or auxend(13) or auxend(12));
	sor<= not(auxend(15) or auxend(14) or auxend(13) or not(auxend(12)));
	Wren<= por and W_DD;
	E<= W_DD and sor;
	notstall <= not(addstall);
	regaux: reg port map(notstall,Clock,Resetn,AddroutT,auxend);
	led: reg port map(E,Clock,Resetn,DoutT,LEDR);
END Behavior;
