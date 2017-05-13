Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;


ENTITY adder IS
	PORT( 
			sub: in std_logic;
			clk: in std_LOGIC;
			clear: in std_LOGIC;
			A: IN  STD_LOGIC_VECTOR(7 DOWNTO 0); --para o sinal
		   B: IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- entrada que ja está na memoria
		   S: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

		  );
	END adder;

ARCHITECTURE behavior of adder IS
	


begin
	process(clk,clear,A,B)
	variable mem:std_LOGIC_VECTOR(7 DOWNTO 0):= B;
	begin
		if(clear = '0') then
			mem := "00000000";
		else
			if(rising_edge(clk)) then
				if(sub='0') then
					mem := A + mem;
				else
					mem := A - mem;
				end if;
			end if;
			S <= mem;
		end if;
	end process;

end behavior;
