

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all ;

ENTITY cont1s IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		RESET	: IN STD_LOGIC ;
		S1		: OUT STD_LOGIC

	);
END cont1s;


ARCHITECTURE SYN OF cont1s IS


BEGIN
		
	PROCESS(clock,RESET)
	variable C: STD_LOGIC;
	variable vaisomando : std_logic_vector(25 DOWNTO 0) := "00000000000000000000000000";

  BEGIN	
	 
  IF ( rising_edge(clock)) THEN
		IF(RESET = '1') THEN
			vaisomando:="00000000000000000000000000";
			C:='1';
		ELSE
			IF(vaisomando =  "10111110101111000010000000") THEN
				C := '0';
			ELSE
				vaisomando := vaisomando + '1' ;
				C:= '1';
			END IF;
		 END IF;
    END IF;
			S1<=C;
	END PROCESS;


END SYN;
