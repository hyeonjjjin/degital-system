--ALU
Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;

Entity ALU is 
  port( S : in std_logic_vector(2 downto 0);
	A : in std_logic_vector(4 downto 1);
	B : in std_logic_vector(4 downto 1);
        C: out std_logic_vector(8 downto 1);
	OUT_C: out std_logic
	);
end ALU;

Architecture alu_case of ALU is
signal OUT_ARR : std_logic_vector(8 downto 1);
begin
alu_case: process(s,a,b, out_arr)
begin
if S ="000" then 
	OUT_ARR <= ("0000" & A)+("0000" & B);
	OUT_C <= OUT_ARR(5);
	C <= OUT_ARR;
elsif S="001" then 
	OUT_ARR <= ("0000" & A)+("0000" & (not B + 1));
	OUT_C <= OUT_ARR(5);
	C <= OUT_ARR;
elsif S="010" then 
	OUT_ARR <= A * B;
	OUT_C <= '0';
	C <= OUT_ARR;
elsif S="011" then
	OUT_ARR <=("0000" & A) or("0000" & B);
	OUT_C <= '0';
	C <= OUT_ARR;
elsif S="100" then
	OUT_ARR <=("0000" & A) and ("0000" & B);
	OUT_C <= '0';
	C <= OUT_ARR;
elsif S="101" then 
	OUT_ARR <=("0000" & A) xor ("0000" & B);
	OUT_C <= '0';
	C <= OUT_ARR; 
elsif S="110" then
	if A=B then OUT_ARR<="00000000";
	else OUT_ARR<= "00000001";
	end if;
	OUT_C <= '0';
	C <= OUT_ARR; 
else 
	OUT_ARR <= "0000"& A(2 downto 1) & A(4 downto 3);
	OUT_C <= '0';
	C <= OUT_ARR;
end if;	
end process;
end alu_case;
