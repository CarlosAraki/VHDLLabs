Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

	ENTITY lab6 IS
		PORT ( SW : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7 : out std_LOGIC_VECTOR (6 DOWNTO 0));
		END lab6;
	
ARCHITECTURE Behavior OF lab6 IS
component adder8_bits IS
		PORT ( EN1,EN2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
						COUT: OUT STD_LOGIC;
						SAI : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)); 	
END component;
	
component char_7seg IS
	
	PORT ( C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	
END component;
	
	signal A, B: std_LOGIC_VECTOR(7 downto 0);
	SIGnal S: std_LOGIC_VECTOR(15 downto 0);
	signal en1,en2,en3,en4,en5,en6,en7,en8,en9,en10,en11,en12,en13,en14:std_LOGIC_VECTOR(7 downto 0); 
	signal ss1,ss2,ss3,ss4,ss5,ss6:std_LOGIC_VECTOR(7 downto 0); 
begin
	A <= SW(15 DOWNTO 8);
	B <= SW(7 DOWNTO 0);
	C1: char_7seg port map(A(7 DOWNTO 4),HEX7);
	C2: char_7seg port map(A(3 DOWNTO 0),HEX6);
	C3: char_7seg port map(B(7 DOWNTO 4),HEX5);
	C4: char_7seg port map(B(3 DOWNTO 0),HEX4);
	
	S(0) <= A(0) AND B(0);
	en1(6 downto 0) <= A(7 downto 1) when (B(0) = '1') else "0000000";
	en1(7) <= '0';
	en2(7 downto 0) <= A(7 downto 0) when (B(1) = '1') else "00000000";
	P1: adder8_bits port map(en1,en2,en3(7),ss1);
	
	S(1) <= ss1(0);
	en3(6 downto 0) <= ss1(7 downto 1);
	en4(7 downto 0) <= A(7 downto 0) when (B(2) = '1') else "00000000";
	P2: adder8_bits port map(en3,en4,en5(7),ss2);
	
	S(2) <= ss2(0);
	en5(6 downto 0) <= ss2(7 downto 1);
	en6(7 downto 0) <= A(7 downto 0) when (B(3) = '1') else "00000000";
	P3: adder8_bits port map(en5,en6,en7(7),ss3);
	
	S(3) <= ss3(0);
	en7(6 downto 0) <= ss3(7 downto 1);
	en8(7 downto 0) <= A(7 downto 0) when (B(4) = '1') else "00000000";
	P4: adder8_bits port map(en7,en8,en9(7),ss4);
	--
	S(4) <= ss4(0);
	en9(6 downto 0) <= ss4(7 downto 1);
	en10(7 downto 0) <= A(7 downto 0) when (B(5) = '1') else "00000000";
	P5: adder8_bits port map(en9,en10,en11(7),ss5);
	
	S(5) <= ss5(0);
	en11(6 downto 0) <= ss5(7 downto 1);
	en12(7 downto 0) <= A(7 downto 0) when (B(6) = '1') else "00000000";
	P6: adder8_bits port map(en11,en12,en13(7),ss6);
	
	S(6) <= ss6(0);
	en13(6 downto 0) <= ss6(7 downto 1);
	en14(7 downto 0) <= A(7 downto 0) when (B(7) = '1') else "00000000";
	P7: adder8_bits port map(en13,en14,S(15),S(14 DOWNTO 7));
	
	C5: char_7seg port map(S(15 DOWNTO 12),HEX3);
	C6: char_7seg port map(S(11 DOWNTO 8),HEX2);
	C7: char_7seg port map(S(7 DOWNTO 4),HEX1);
	C8: char_7seg port map(S(3 DOWNTO 0),HEX0);
	
	
END Behavior;	
	
