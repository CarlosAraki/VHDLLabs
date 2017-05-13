

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all ;

ENTITY cont5s IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		RESET	: IN STD_LOGIC ;
		S5		: OUT STD_LOGIC

	);
END cont5s;


ARCHITECTURE SYN OF cont5s IS


BEGIN
		
	PROCESS(clock,RESET)
	variable C: STD_LOGIC;
	variable vaisomando : std_logic_vector(27 DOWNTO 0) := "0000000000000000000000000000";

  BEGIN	
	 
  IF ( rising_edge(clock)) THEN
		IF(RESET = '1') THEN
			vaisomando:="0000000000000000000000000000";
			C:='1';
		ELSE
			IF(vaisomando =  "1110111001101011001010000000") THEN
				C := '0';
			ELSE
				vaisomando := vaisomando + '1' ;
				C:= '1';
			END IF;
		END IF; 
    END IF;
			S5<=C;
	END PROCESS;


END SYN;
