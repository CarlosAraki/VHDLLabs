

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all ;

ENTITY contmega50 IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		s1		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		s2		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		m1		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		m2		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		h1		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		h2		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
END contmega50;


ARCHITECTURE SYN OF contmega50 IS


BEGIN
		
	PROCESS(clock)
	variable C: STD_LOGIC;
	variable vaisomando : std_logic_vector(25 DOWNTO 0) := "00000000000000000000000000";
	variable sa1:std_LOGIC_VECTOR(3 downto 0) :="0000";
	variable sa2:std_LOGIC_VECTOR(3 downto 0) :="0000";
	variable sm1:std_LOGIC_VECTOR(3 downto 0) :="0000";
	variable sm2:std_LOGIC_VECTOR(3 downto 0) :="0000";
	variable sh1:std_LOGIC_VECTOR(3 downto 0) :="0000";
	variable sh2:std_LOGIC_VECTOR(3 downto 0) :="0000";
  BEGIN	
	 
  IF ( rising_edge(clock)) THEN
      vaisomando := vaisomando + '1' ;
		IF(vaisomando =  "10111110101111000010000000") THEN
			vaisomando := "00000000000000000000000000";
			C := '1';
		ELSE
			C:= '0';
		END IF;
		 sa1 := sa1 + C;
		 IF(sa1 = "1010") 	THEN
				sa1 := "0000";
				s1<=sa1;
				sa2 := sa2 + C;
				IF(sa2 = "0110")	THEN
					sa2 :="0000";
					s2<=sa2;
					sm1 := sm1 + C;
					IF(sm1 = "1010") THEN
						sm1 := "0000";
						m1<=sm1;
						sm2 := sm2 +C;
						if(sm2 = "0110") then
							sm2 := "0000";
							m2<=sm2;
							sh1 := sh1 +C;
							if(sh1 = "1010") then
								sh1 := "0000";
								h1<=sh1;
								sh2 := sh2 +C;
								if(sh2 = "0011") then
									sh2:="0000";
									h2<=sh2;
								else
									h2<=sh2;
								end if;
							else
								h1<=sh1;
							end if;
						else
							m2<=sm2;
						end if;
					else
						m1<=sm1;
					END IF;
				else
					s2<=sa2;
				END IF;
		 ELSE
				s1<=sa1;
		 END IF;
    END IF;
			
	END PROCESS;


END SYN;
