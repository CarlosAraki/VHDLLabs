LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY PROC IS
	PORT ( 						DIN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				Resetn, Clock, Run : IN STD_LOGIC;
								  Done : BUFFER STD_LOGIC;
							 BusWires : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0));
END PROC;


ARCHITECTURE Behavior OF PROC IS

	component dec3to8 IS

	PORT ( W : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			En : IN STD_LOGIC;
			 Y : OUT STD_LOGIC_VECTOR(0 TO 7));
	END component;

	component regn IS

	GENERIC (n : INTEGER := 16);

	PORT ( 			R : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			Rin, Clock: IN STD_LOGIC;
				Q : BUFFER STD_LOGIC_VECTOR(n-1 DOWNTO 0));
	END component;

	SIGNAL IR9:STD_LOGIC_VECTOR(8 DOWNTO 0);
	SIGNAL R0,R1,R2,R3,R4,R5,R6,R7,A,ADDSUBV,G:STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL GOUT,DINOUT:STD_LOGIC;
	SIGNAL ROUT:STD_LOGIC_VECTOR(7 DOWNTO 0);
	TYPE State_type IS (T0, T1, T2, T3);
	SIGNAL Tstep_Q, Tstep_D: State_type;
	--
	BEGIN
		High <= ’1’;
		I <= IR(0 TO 2);
		decX: dec3to8 PORT MAP (IR(3 TO 5), High, Xreg);
		decY: dec3to8 PORT MAP (IR(6 TO 8), High, Yreg);

		statetable: PROCESS (Tstep_Q, Run, Done)
		BEGIN
			CASE Tstep_Q IS
				WHEN T0 => IF(Run = ’0’) THEN Tstep_D <= T0;
				ELSE Tstep_D <= T1;
			END IF; -- data is loaded into IR in this time step
			-- other states
			END CASE;
		END PROCESS;

		controlsignals: PROCESS (Tstep_Q, I, Xreg, Yreg)
		BEGIN
			--specify initial values
			CASE Tstep_Q IS
				WHEN T0 => -- store DIN in IR as long as Tstep_Q = 0
						IRin <= ’1’;
				WHEN T1 => -- define signals in time step T1
				CASE I IS
				--
				END CASE;
				WHEN T2 => -- define signals in time step T2
				CASE I IS
				--
				END CASE;
				WHEN T3 => -- define signals in time step T3
				CASE I IS
				--
				END CASE;
			END CASE;
		END PROCESS;
		fsmflipflops: PROCESS (Clock, Resetn, Tstep_D)
		BEGIN
		--process do flipflop
		END PROCESS;
			reg_0: regn PORT MAP (BusWires, Rin(0), Clock, R0);
			-- instantiate other registers and the adder/subtracter unit
			-- define the bus
END Behavior;
