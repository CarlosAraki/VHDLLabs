library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

	entity lab8 is
	port (
			SW : IN STD_LOGIC_VECTOR (8 downto 0);
			CLOCK_50:IN STD_LOGIC;
			HEX0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX3: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
end lab8;
architecture behavior of lab8 is
COMPONENT char_7seg IS
	
	PORT ( C : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	
END COMPONENT;
COMPONENT cont1s IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		RESET	: IN STD_LOGIC ;
		S1		: OUT STD_LOGIC

	);
END COMPONENT;

COMPONENT cont5S IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		RESET	: IN STD_LOGIC ;
		S5		: OUT STD_LOGIC

	);
END COMPONENT;



	SIGNAL RESETF,RESET: STD_LOGIC:='0';
	SIGNAL VS,TMIN,TAM: STD_LOGIC;
	signal SINAL1, SINAL2:STD_LOGIC_VECTOR(1 DOWNTO 0);
	TYPE State_type IS (A, B, C, D);
	
	SIGNAL y_Q, y_D : State_type; 


	
BEGIN

	VS <=SW(8);
	a1: cont5s port map (CLOCK_50,RESET,TMIN);
	a2: cont1s port map(CLOCK_50,RESET,TAM);
	PROCESS (VS,TMIN,TAM,y_Q,RESET)
		BEGIN
			case y_Q IS
				
				WHEN A => IF (TMIN = '0' AND VS ='1' AND RESET = '0') THEN
											y_D <=B ;
											RESETF <= '1';
							 ELSE
											y_D <= A;
											RESETF <= '0';
				          END IF;
			
				when B => IF (RESET = '0' AND TAM = '0') THEN
											y_D <= C ;
											RESETF <= '1';
							 ELSE
											y_D <= B;
											RESETF <= '0';
							 END IF;
			
				when C => IF ((TMIN='0' OR VS='0') AND RESET = '0') THEN 
											y_D <= D;
											RESETF <= '1';
							 ELSE
											y_D <= C;
											RESETF <= '0';
				          END IF;
			
				when D => IF(RESET = '0' AND TAM = '0') THEN
											y_D <= A;
											RESETF <= '1';
							 ELSE
											y_D <= D;
											RESETF <= '0';
							 END IF;
	
		END CASE;
		
	END PROCESS;

	PROCESS (y_Q,CLOCK_50,RESETF)
		VARIABLE SAI1:STD_LOGIC_VECTOR(1 DOWNTO 0);
		VARIABLE SAI2:STD_LOGIC_VECTOR(1 DOWNTO 0);
		BEGIN
			if (rising_edge(CLOCK_50)) then
				if (y_D = A) then
					SAI1 :="10";
					SAI2 :="00";
					y_Q <=A;
				elsif(y_D = B) then
					SAI1 :="01";
					SAI2 :="00";
					y_Q <=B;
				elsif(y_D = C) then
				   SAI1 :="00";
					SAI2 :="10";
					y_Q <=C;
				elsif(y_D = D) then
				   SAI1 :="00";
					SAI2 :="01";
					y_Q <=D;
				end if;
				RESET<=RESETF;
			end if;				 
	SINAL1 <= SAI1;
	SINAL2 <= SAI2;
	
		END PROCESS;
		
B1: char_7seg port map(SINAL1,HEX0);
B2: char_7seg port map(SINAL2, HEX3);
	END BEHAVIOR;