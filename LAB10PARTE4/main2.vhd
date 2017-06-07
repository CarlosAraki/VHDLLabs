-- ES575 - Laboratório de Circuitos Lógicos
-- Laboratório 10(Parte III) - Projeto de Máquinas de Estados Temporizadas
-- Aluno: Carlos Vinícius Araki Oliveira - RA:160141
-- Aluno: Cleber França Carvalho         - RA:145739

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY parte4 IS
	PORT (
				Resetn,Run:in STD_LOGIC;
				SW: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				CLOCK_50: IN STD_LOGIC;
				LEDR : out std_logic_vector(15 downto 0);
				HEX0 :out std_LOGIC_VECTOR(6 downto 0);
				HEX1 :out std_LOGIC_VECTOR(6 downto 0);
				HEX2 :out std_LOGIC_VECTOR(6 downto 0);
				HEX3 :out std_LOGIC_VECTOR(6 downto 0);
				HEX4 :out std_LOGIC_VECTOR(6 downto 0);
				HEX5 :out std_LOGIC_VECTOR(6 downto 0);
				HEX6 :out std_LOGIC_VECTOR(6 downto 0);
				HEX7 :out std_LOGIC_VECTOR(6 downto 0);
				Done: out STD_LOGIC);
END parte4;



ARCHITECTURE Behavior OF parte4 IS

component seg7_scroll IS
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
END component;



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

COMPONENT port_n IS
		PORT ( chaves : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				memmoria: in std_logic_vector(15 downto 0);
				sel,Clk,Clear: in STD_LOGIC;
				saida: out std_logic_vector(15 downto 0)
			   );
	END COMPONENT;



signal auxend,DINN,AddroutT,DoutT,saidaport: std_logic_vector(15 downto 0);
signal notstall,addstall,W_DD,Wren,por,sor,E,h0or,seleci,Clock: STD_LOGIC;


BEGIN
	Clock<=CLOCK_50;
	proc1: PROC port map(saidaport,AddroutT,DoutT,Resetn,Clock,Run,addstall,W_DD,Done);
	por<= not(auxend(15) or auxend(14) or auxend(13) or auxend(12));
	sor<= not(auxend(15) or auxend(14) or auxend(13) or not(auxend(12)));
	h0or<=not(auxend(15) or auxend(14) or not(auxend(13)) or auxend(12)); --0010
	seleci<= not(auxend(15) or auxend(14) or NOT(auxend(13)) or NOT(auxend(12)));--0011
	Wren<= por and W_DD;
	E<= W_DD and sor;
	notstall <= not(addstall);
	regaux: reg port map(notstall,Clock,Resetn,AddroutT,auxend);
	--meus IOs
	portn: port_n port map(SW,DINN,seleci,Clock,Resetn,saidaport);
	led: reg port map(E,Clock,Resetn,DoutT,LEDR);
	memoria: memRAM port map(AddroutT(6 downto 0),addstall,Clock,DoutT,Wren,DINN);
	scroll: seg7_scroll port map(h0or,Clock,Resetn,E,addstall(2 downto 0),Dout(6 downto0),HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7);
END Behavior;
