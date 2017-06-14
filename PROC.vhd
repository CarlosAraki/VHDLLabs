-- ES575 - Laboratório de Circuitos Lógicos
-- Laboratório 10(Parte III) - Projeto de Máquinas de Estados Temporizadas
-- Aluno: Carlos Vinícius Araki Oliveira - RA:160141
-- Aluno: Cleber França Carvalho         - RA:145739

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY PROC IS
	PORT ( DIN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			Addrout,Dout: out STD_LOGIC_VECTOR(15 DOWNTO 0);
		   Resetn, Clock, Run : IN STD_LOGIC;
			 Addrstall,W_D : out STD_LOGIC;
			Done: BUFFER STD_LOGIC);
END PROC;


ARCHITECTURE Behavior OF PROC IS
component add_sub IS 										--ALU
	PORT
	(
		add_sub		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		overflow	: OUT STD_LOGIC ;
		result		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
	END component;

	component counterr7 IS
	PORT (incr_pc,R7in,Clk,Clear : IN STD_LOGIC;
				data:in std_logic_vector(15 downto 0);
			q : OUT std_logic_vector(15 downto 0));
	END component;

COMPONENT reg IS											--COMPONENT
	PORT ( Sel,Clk,Clear : IN STD_LOGIC;
			data:in std_logic_vector(15 downto 0);
			q : OUT std_logic_vector(15 downto 0));
	END COMPONENT;


component regip IS									--REGIP
	PORT ( Sel,Clk,Clear : IN STD_LOGIC;
			data:in std_logic_vector(8 downto 0);
			q : OUT std_logic_vector(8 downto 0));
	END component;

component mux10 IS									--MUX10
	PORT (
			selR:in std_logic_vector(0 to 7);
			Gout,DINOUTx: IN STD_LOGIC;
			dentrada,r0,r1,r2,r3,r4,r5,r6,r7,g:in std_logic_vector(15 downto 0);
			q : OUT std_logic_vector(15 downto 0));
	END component;


	component dec3to8 IS															--DEC3TO8

	PORT ( W : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		   En : IN STD_LOGIC;
		   Y : OUT STD_LOGIC_VECTOR(0 TO 7));
	END component;

	component regn IS																--REGN

	GENERIC (n : INTEGER := 16);

	PORT (R : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		  Rin, Clock: IN STD_LOGIC;
		  Q : BUFFER STD_LOGIC_VECTOR(n-1 DOWNTO 0));
	END component;


signal R0,R1,R2,R3,R4,R5,R6,R7,G,A,ADDSUBV: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL IR :STD_LOGIC_VECTOR (0 to 8);
SIGNAL Gzero,High,R7out,RYout,over,RXin,RXout,IRin,DINout,Ain,Gin,Gout,add_subsignal,incr_pc,ADDRin,DOUTin:STD_LOGIC;
SIgnal Xreg,Yreg,Rout: STD_LOGIC_VECTOR(7 downto 0);
signal Rin : STD_LOGIC_VECTOR(0 to 7);
signal I : std_logic_vector(0 to 2);
signal BusWires : STD_LOGIC_VECTOR(15 DOWNTO 0);
	TYPE State_type IS (T00,T01,T0, T1, T2, T3);
	SIGNAL Tstep_Q, Tstep_D: State_type; -- estado atual(Q) e estado futuro(D)
	--
	BEGIN
		High <= '1';
		I <= IR(0 TO 2);
		decX: dec3to8 PORT MAP (IR(3 TO 5), High, Xreg);
		decY: dec3to8 PORT MAP (IR(6 TO 8), High, Yreg);

		statetable: PROCESS (Tstep_Q, Run, Done) --máquina de estados!
		BEGIN
			CASE Tstep_Q IS
			WHEN T00 => IF(Run = '0') THEN Tstep_D <= T00;
				ELSE Tstep_D <= T01;
				END IF;
			WHEN T01 => IF(Run = '0') THEN Tstep_D <= T01;
				ELSE Tstep_D <= T0;
				END IF;
			WHEN T0 => IF(Run = '0') THEN Tstep_D <= T0;
				ELSE Tstep_D <= T1;
			END IF;                                        -- data is loaded into IR in this time step
			--paralizo os estados
				WHEN T1 => IF(Run = '0') THEN Tstep_D <= T1;
				ELSif Done='1' then Tstep_D <= T00;
				else Tstep_D <= T2;
			END IF;
				WHEN T2 => IF(Run = '0') THEN Tstep_D <= T2;
				ELSif Done='1' then Tstep_D <= T00;
				else Tstep_D <= T3;
			END IF;
				WHEN T3 => IF(Run = '0') THEN Tstep_D <= T3;
				ELSe Tstep_D <= T00;
			END IF;
		END CASE;
		END PROCESS;

		controlsignals: PROCESS (Tstep_Q, I, Xreg, Yreg,Gzero)
		BEGIN
			--specify initial values
		if(G = "0000000000000000") then
				Gzero <= '1';
		else
				Gzero <= '0';
		end if;
			CASE Tstep_Q IS
				when T00=>
						RYout<='0';
						RXin <='0';
						Done <='0';
						RXout <= '0';
						IRin <='0';
						DINout<='0';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='0';
						r7out <= '1';
						Addrstall<='0';
				when T01=>
						RYout<='0';
						RXin <='0';
						Done <='0';
						RXout <='0';
						IRin <='0';
						DINout<='0';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='0';
						r7out <= '0';
						Addrstall<='1';
				WHEN T0 => -- store DIN in IR as long as Tstep_Q = 0
						RYout<='0';
						RXin <='0';
						Done <='0';
						RXout <='0';
						IRin <='1';
						DINout<='0';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='1';
						r7out <= '0';
						Addrstall<='0';
				WHEN T1 => -- define signals in time step T1
				CASE I IS
				when "000" => --mv
						RYout<='1';
						RXin <='1';
						Done <='1';
						RXout <= '0';
						IRin <='0';
						DINout<='0';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						r7out <= '0';
						incr_pc<='0';
						Addrstall<='0';
				when "001" => -- mvi
						RYout<='0';
						RXin <='0';
						Done <='0';
						RXout <= '0';
						IRin <='0';
						DINout <='0';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='0';
						Addrstall<='0';
						r7out <= '1';
				when "010" => --add
						RYout<='0';
						RXin <='0';
						Done <='0';
						RXout <= '1';
						IRin <='0';
						DINout <='0';
						Ain <='1';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='0';
						Addrstall<='0';
						r7out <= '0';
				when "011" => --sub
						RYout<='0';
						RXin <='0';
						Done <='0';
						RXout <= '1';
						IRin <='0';
						DINout <='0';
						Ain <='1';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='0';
						Addrstall<='0';
						r7out <= '0';
				when "100" => --ld
						RYout<='1';
						RXin <='0';
						Done <='0';
						RXout <= '0';
						IRin <='0';
						DINout <='0';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='0';
						Addrstall<='0';
						r7out <= '0';
				when "101" => --st t1
						RYout<='1';
						RXin <='0';
						Done <='0';
						RXout <= '0';
						IRin <='0';
						DINout <='0';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='0';
						Addrstall<='0';
						r7out <= '0';
				when "110" => --mvnz
						RYout<='1';
						RXin <='1' and (not(Gzero));
						Done <='1';
						RXout <= '0';
						IRin <='0';
						DINout<='0';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						r7out <= '0';
						incr_pc<='0';
						Addrstall<='0';
				when others =>
						RYout<='0';
						RXin <='0';
						Done <='0';
						RXout <= '0';
						IRin <='0';
						DINout<='0';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='0';
						Addrstall<='0';
						r7out <= '0';
				END CASE;
				WHEN T2 => -- define signals in time step T2
				CASE I IS
				when "001" => -- mvi
						RYout<='0';
						RXin <='0';
						Done <='0';
						RXout <= '0';
						IRin <='0';
						DINout <='0';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='1';
						Addrstall<='1';
						r7out <= '0';
				when "010" =>
						RYout<='1';
						RXin <='0';
						Done <='0';
						RXout <= '0';
						IRin <='0';
						DINout <='0';
						Ain <='0';
						Gin <='1';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='0';
						Addrstall<='0';
						r7out <= '0';
				when "011" =>
						RYout<='1';
						RXin <='0';
						Done <='0';
						RXout <= '0';
						IRin <='0';
						DINout <='0';
						Ain <='0';
						Gin <='1';
						Gout <='0';
						add_subsignal <= '0';
						W_D<='0';
						incr_pc<='0';
						Addrstall<='0';
						r7out <= '0';
				when "100" => --ld
						RYout<='0';
						RXin <='0';
						Done <='0';
						RXout <= '0';
						IRin <='0';
						DINout <='0';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='0';
						Addrstall<='1';
						r7out <= '0';
				when "101" => --st t2
						RYout<='0';
						RXin <='0';
						Done <='0';
						RXout <= '1';
						IRin <='0';
						DINout <='0';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='1';
						incr_pc<='0';
						Addrstall<='1';
						r7out <= '0';
				when others =>
						RYout<='0';
						RXin <='0';
						Done <='0';
						RXout <= '0';
						IRin <='0';
						DINout<='0';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='0';
						Addrstall<='0';
						r7out <= '0';
				END CASE;
				WHEN T3 => -- define signals in time step T3
				CASE I IS
				when "001" => --mvin
						RYout<='0';
						RXin <='1';
						Done <='1';
						RXout <= '0';
						IRin <='0';
						DINout <='1';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '0';
						W_D<='0';
						incr_pc<='0';
						Addrstall<='0';
						r7out <= '0';
				when "010" =>
						RYout<='0';
						RXin <='1';
						Done <='1';
						RXout <= '0';
						IRin <='0';
						DINout <='0';
						Ain <='0';
						Gin <='0';
						Gout <='1';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='0';
						Addrstall<='0';
						r7out <= '0';
				when "011" =>
						RYout<='0';
						RXin <='1';
						Done <='1';
						RXout <= '0';
						IRin <='0';
						DINout <='0';
						Ain <='0';
						Gin <='0';
						Gout <='1';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='0';
						Addrstall<='0';
						r7out <= '0';
				when "100" => --ld
						RYout<='0';
						RXin <='1';
						Done <='1';
						RXout <= '0';
						IRin <='0';
						DINout <='1';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='0';
						Addrstall<='0';
						r7out <= '0';
				when "101" => --st t3
						RYout<='0';
						RXin <='0';
						Done <='1';
						RXout <='1';
						IRin <='0';
						DINout <='0';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='1';
						incr_pc<='0';
						Addrstall<='1';
						r7out <= '0';
				when others =>
						RYout<='0';
						RXin <='0';
						Done <='0';
						RXout <= '0';
						IRin <='0';
						DINout<='0';
						Ain <='0';
						Gin <='0';
						Gout <='0';
						add_subsignal <= '1';
						W_D<='0';
						incr_pc<='0';
						Addrstall<='0';
						r7out <= '0';
				END CASE;
			END CASE;
		END PROCESS;
		fsmflipflops: PROCESS (Clock, Resetn, Tstep_D)
		BEGIN

		--process do flipflop
		if(Resetn = '1') then -- reseta os valore do ff
			Tstep_Q <= T00;
		elsif (rising_edge(Clock)) then -- avança estados
			Tstep_Q <=Tstep_D;
		end if;

		END PROCESS;

		Rin <= Xreg WHEN RXin ='1' -- 0 -- definindo qual registrador de origem e destino
							ELSE "00000000";
		Rout <=  Xreg WHEN RXout ='1' -- 0
							ELSE Yreg WHEN RYout = '1' --1
							else "00000001" WHEN R7out = '1'
							ELSE "00000000";
		reg_0: reg PORT MAP (Rin(0),Clock,Resetn,BusWires,R0);
		reg_1: reg PORT MAP (Rin(1),Clock,Resetn,BusWires,R1);
		reg_2: reg PORT MAP (Rin(2),Clock,Resetn,BusWires,R2);
		reg_3: reg PORT MAP (Rin(3),Clock,Resetn,BusWires,R3);
		reg_4: reg PORT MAP (Rin(4),Clock,Resetn,BusWires,R4);
		reg_5: reg PORT MAP (Rin(5),Clock,Resetn,BusWires,R5);
		reg_6: reg PORT MAP (Rin(6),Clock,Resetn,BusWires,R6);
		reg_7: counterr7 PORT MAP (incr_pc,Rin(7),Clock,Resetn,BusWires,R7);
		reg_g: reg PORT MAP (Gin,Clock,Resetn,ADDSUBV,G);
		reg_A: reg PORT MAP (Ain,Clock,Resetn,BusWires,A);
		reg_ip: regip PORT MAP (IRin,Clock,'0',DIN(15 downto 7),IR);
		muxxx: mux10 PORT MAP(Rout,Gout,DINout,DIN,R0,R1,R2,R3,R4,R5,R6,R7,G,BusWires);
		add: add_sub PORT MAP(add_subsignal,A,BusWires,over,ADDSUBV);
		
		ADDrout <= BusWires;
		Dout <= BusWires;
		
END Behavior;
