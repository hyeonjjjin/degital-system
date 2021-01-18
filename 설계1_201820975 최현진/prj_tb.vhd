library ieee;
use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;

entity prj_tb is
end prj_tb;

architecture tb_arch of prj_tb is
	component ALU
	port(
		S : std_logic_vector(2 downto 0);
		A : in std_logic_vector(4 downto 1);
		B : in std_logic_vector(4 downto 1);
     	  	C: out std_logic_vector(8 downto 1);
		OUT_C : out std_logic
 	);
	end component;
	signal S : std_logic_vector(2 downto 0);
	signal A : std_logic_vector(4 downto 1);
	signal B : std_logic_vector(4 downto 1);
	signal C : std_logic_vector(8 downto 1);
	signal OUT_C : std_logic;

begin
	UUT : ALU
		port map ( S=> S,A =>A, B=>B, C=>C, OUT_C =>OUT_C  );

process
begin
-- S="000"
	-- case 0 
	S <= "000";
	A <= "0011";
	B <= "0100";
	wait for 10 ns;
		
 	-- case 1
	S <= "000";
	A <= "1011";
	B <= "1101";
	wait for 10 ns;

	-- case 2
	S <= "000";
	A <= "0100";
	B <= "1001";
	wait for 10 ns;

	-- case 3
	S <= "000";
	A <= "0110";
	B <= "1101";
	wait for 10 ns;

	-- case 4
	S <= "000";
	A <= "1111";
	B <= "1111";
	wait for 10 ns;
	
-- S="001"
	-- case 0 
	S <= "001";
	A <= "0011";
	B <= "0100";
	wait for 10 ns;
		
 	-- case 1
	S <= "001";
	A <= "1011";
	B <= "1101";
	wait for 10 ns;

	-- case 2
	S <= "001";
	A <= "0100";
	B <= "1001";
	wait for 10 ns;

	-- case 3
	S <= "001";
	A <= "0110";
	B <= "1101";
	wait for 10 ns;

	-- case 4
	S <= "001";
	A <= "1111";
	B <= "1111";
	wait for 10 ns;	

-- S="010"
	-- case 0 
	S <= "010";
	A <= "0011";
	B <= "0100";
	wait for 10 ns;
		
 	-- case 1
	S <= "010";
	A <= "1011";
	B <= "1101";
	wait for 10 ns;

	-- case 2
	S <= "010";
	A <= "0100";
	B <= "1001";
	wait for 10 ns;

	-- case 3
	S <= "010";
	A <= "0110";
	B <= "1101";
	wait for 10 ns;

	-- case 4
	S <= "010";
	A <= "1111";
	B <= "1111";
	wait for 10 ns;

-- S="011"
	-- case 0 
	S <= "011";
	A <= "0011";
	B <= "0100";
	wait for 10 ns;
		
 	-- case 1
	S <= "011";
	A <= "1011";
	B <= "1101";
	wait for 10 ns;

	-- case 2
	S <= "011";
	A <= "0100";
	B <= "1001";
	wait for 10 ns;

	-- case 3
	S <= "011";
	A <= "0110";
	B <= "1101";
	wait for 10 ns;

	-- case 4
	S <= "011";
	A <= "1111";
	B <= "1111";
	wait for 10 ns;

-- S="100"
	-- case 0 
	S <= "100";
	A <= "0011";
	B <= "0100";
	wait for 10 ns;
		
 	-- case 1
	S <= "100";
	A <= "1011";
	B <= "1101";
	wait for 10 ns;

	-- case 2
	S <= "100";
	A <= "0100";
	B <= "1001";
	wait for 10 ns;

	-- case 3
	S <= "100";
	A <= "0110";
	B <= "1101";
	wait for 10 ns;

	-- case 4
	S <= "100";
	A <= "1111";
	B <= "1111";
	wait for 10 ns;

-- S="101"
	-- case 0 
	S <= "101";
	A <= "0011";
	B <= "0100";
	wait for 10 ns;
		
 	-- case 1
	S <= "101";
	A <= "1011";
	B <= "1101";
	wait for 10 ns;

	-- case 2
	S <= "101";
	A <= "0100";
	B <= "1001";
	wait for 10 ns;

	-- case 3
	S <= "101";
	A <= "0110";
	B <= "1101";
	wait for 10 ns;

	-- case 4
	S <= "101";
	A <= "1111";
	B <= "1111";
	wait for 10 ns;

-- S="110"
	-- case 0 
	S <= "110";
	A <= "0011";
	B <= "0100";
	wait for 10 ns;
		
 	-- case 1
	S <= "110";
	A <= "1011";
	B <= "1101";
	wait for 10 ns;

	-- case 2
	S <= "110";
	A <= "0100";
	B <= "1001";
	wait for 10 ns;

	-- case 3
	S <= "110";
	A <= "0110";
	B <= "1101";
	wait for 10 ns;

	-- case 4
	S <= "110";
	A <= "1111";
	B <= "1111";
	wait for 10 ns;

-- S="111"
	-- case 0 
	S <= "111";
	A <= "0011";
	B <= "0100";
	wait for 10 ns;
		
 	-- case 1
	S <= "111";
	A <= "1011";
	B <= "1101";
	wait for 10 ns;

	-- case 2
	S <= "111";
	A <= "0100";
	B <= "1001";
	wait for 10 ns;

	-- case 3
	S <= "111";
	A <= "0110";
	B <= "1101";
	wait for 10 ns;

	-- case 4
	S <= "111";
	A <= "1111";
	B <= "1111";
	wait for 10 ns;

end process;

end tb_arch;
