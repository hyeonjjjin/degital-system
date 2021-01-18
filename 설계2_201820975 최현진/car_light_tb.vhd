library ieee;
use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;

entity car_light_tb is
end car_light_tb;

architecture tb_arch of car_light_tb is
	component CAR_Light
	port(
	Q : in std_logic_vector(2 downto 0);
	Q_next : out std_logic_vector(2 downto 0);

	input_HAZ : in std_logic;
	input_LEFT : in std_logic;
	input_RIGHT : in std_logic;

        LC : out std_logic;
	LB : out std_logic;
	LA : out std_logic;
	RA : out std_logic;
	RB : out std_logic;
	RC : out std_logic
 	);

	end component;
	signal Q : std_logic_vector(2 downto 0);
	signal Q_next : std_logic_vector(2 downto 0);

	signal input_HAZ : std_logic;
	signal input_LEFT : std_logic;
	signal input_RIGHT : std_logic;

        signal LC : std_logic;
	signal LB : std_logic;
	signal LA : std_logic;
	signal RA : std_logic;
	signal RB : std_logic;
	signal RC : std_logic;

begin
	UUT : CAR_Light
		port map ( Q=>Q, Q_next=>Q_next, input_HAZ=>input_HAZ, input_LEFT=>input_LEFT, input_RIGHT=>input_RIGHT, LC=>LC, LB=>LB, LA=>LA, RC=>RC, RB=>RB, RA=>RA  );

process
begin

-- Q state is L1
	Q <= "001";
	wait for 10 ns;
-- Q state is L2
	Q <= "011";
	wait for 10 ns;
-- Q state is L3
	Q <= "010";
	wait for 10 ns;

-- Q state is R1
	Q <= "101";
	wait for 10 ns;
-- Q state is R2
	Q <= "111";
	wait for 10 ns;
-- Q state is R3
	Q <= "110";
	wait for 10 ns;

-- Q state is LR1
	Q <= "100";
	wait for 10 ns;

-- Q state is IDLE
	-- case 0 (HAZ + LEFT + RIGHT)'
	Q <= "000";
	input_HAZ <= '0';
	input_LEFT <= '0';
	input_RIGHT <= '0';
	wait for 10 ns;
		
 	-- case 1 HAZ'*LEFT*RIGHT'
	Q <= "000";
	input_HAZ <= '0';
	input_LEFT <= '1';
	input_RIGHT <= '0';
	wait for 10 ns;

	-- case 2 HAZ+LEFT*RIGHT (HAZ == 1)
	Q <= "000";
	input_HAZ <= '1';
	input_LEFT <= '0';
	input_RIGHT <= '0';
	wait for 10 ns;

	-- case 3 HAZ+LEFT*RIGHT (LEFT*RIGHT == 1)
	Q <= "000";
	input_HAZ <= '0';
	input_LEFT <= '1';
	input_RIGHT <= '1';
	wait for 10 ns;

	-- case 4 HAZ'*LEFT'*RIGHT
	Q <= "000";
	input_HAZ <= '0';
	input_LEFT <= '0';
	input_RIGHT <= '1';
	wait for 10 ns;

end process;

end tb_arch;