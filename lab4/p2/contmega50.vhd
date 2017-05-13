

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all ;
LIBRARY lpm;
USE lpm.all;

ENTITY contmega50 IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
END contmega50;


ARCHITECTURE SYN OF contmega50 IS


BEGIN
		
	PROCESS(clock)
	variable C: STD_LOGIC;
	variable vaisomando : std_logic_vector(25 DOWNTO 0) := "00000000000000000000000000";
	variable saida:std_LOGIC_VECTOR(3 downto 0) :="0000";
  BEGIN	
	 
  IF ( rising_edge(clock)) THEN
      vaisomando := vaisomando + '1' ;
		IF(vaisomando =  "10111110101111000010000000") THEN
			vaisomando := "00000000000000000000000000";
			C := '1';
		ELSE
			C:= '0';
		END IF;
		 saida := saida + C;
		 IF(saida = "1010") 	THEN
				saida := "0000";
				q<=saida;
		 ELSE
				q<=saida;
		 END IF;
    END IF;
			
	END PROCESS;


END SYN;
