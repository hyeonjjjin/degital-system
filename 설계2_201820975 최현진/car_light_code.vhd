Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;

Entity CAR_Light is 
  port( Q : in std_logic_vector(2 downto 0);

	input_HAZ : in std_logic;
	input_LEFT : in std_logic;
	input_RIGHT : in std_logic;

	Q_next : out std_logic_vector(2 downto 0);
        LC : out std_logic;
	LB : out std_logic;
	LA : out std_logic;
	RA : out std_logic;
	RB : out std_logic;
	RC : out std_logic
	);
end CAR_Light;

Architecture light_case of CAR_Light is
signal TEMP_ARR : std_logic_vector(6 downto 0);
signal LOUT_ARR : std_logic_vector(3 downto 1);
signal ROUT_ARR : std_logic_vector(3 downto 1);
begin
light_case: process(Q, input_HAZ, input_LEFT, input_RIGHT, TEMP_ARR, LOUT_ARR, ROUT_ARR)
begin
--state = IDLE
if(Q = "000") then
TEMP_ARR(6) <= input_HAZ or (input_LEFT and input_RIGHT);
TEMP_ARR(5) <= (not input_HAZ) and (not input_LEFT) and input_RIGHT;

TEMP_ARR(4) <= (not input_HAZ) and input_LEFT and (not input_RIGHT);
TEMP_ARR(3) <= (not input_HAZ) and (not input_LEFT) and input_RIGHT;

TEMP_ARR(2) <= TEMP_ARR(6) or TEMP_ARR(5);
TEMP_ARR(1) <= '0';
TEMP_ARR(0) <= TEMP_ARR(4) or TEMP_ARR(3);

--state = Ln (n=1,2,3) // Q2=0
elsif(Q(2) = '0') then
TEMP_ARR(2) <= '0';
if(Q="001") then 
TEMP_ARR(1) <= '1';
TEMP_ARR(0) <= '1';
elsif(Q ="011") then
TEMP_ARR(1) <='1';
TEMP_ARR(0) <='0';
else
TEMP_ARR(1) <='0';
TEMP_ARR(0) <='0';
end if;

--state = Rn(n=1,2,3) or LR3 // Q2=1
else
if(Q ="101") then 
TEMP_ARR(2)<='1';
TEMP_ARR(1)<='1';
TEMP_ARR(0)<='1';
elsif(Q ="111") then 
TEMP_ARR(2)<='1';
TEMP_ARR(1)<='1';
TEMP_ARR(0)<='0';
else 
TEMP_ARR(2)<='0';
TEMP_ARR(1)<='0';
TEMP_ARR(0)<='0';
end if;
end if;
Q_next(2) <= TEMP_ARR(2);
Q_next(1) <= TEMP_ARR(1);
Q_next(0) <= TEMP_ARR(0);

LOUT_ARR(3) <=((not TEMP_ARR(2)) and TEMP_ARR(1) and (not TEMP_ARR(0))) or (TEMP_ARR(2)and (not TEMP_ARR(1))and (not TEMP_ARR(0)));
LOUT_ARR(2) <=((not TEMP_ARR(2))and TEMP_ARR(1)and TEMP_ARR(0)) or LOUT_ARR(3);
LOUT_ARR(1) <=( (not TEMP_ARR(2)) and (not TEMP_ARR(1)) and TEMP_ARR(0)) or LOUT_ARR(2);
LC <= LOUT_ARR(3);
LB <= LOUT_ARR(2);
LA <= LOUT_ARR(1);

ROUT_ARR(3) <=(TEMP_ARR(2)and TEMP_ARR(1)and (not TEMP_ARR(0))) or (TEMP_ARR(2)and (not TEMP_ARR(1))and (not TEMP_ARR(0)));
ROUT_ARR(2) <=(TEMP_ARR(2)and TEMP_ARR(1)and TEMP_ARR(0)) or ROUT_ARR(3);
ROUT_ARR(1) <=(TEMP_ARR(2)and (not TEMP_ARR(1))and TEMP_ARR(0)) or ROUT_ARR(2);
RC <= ROUT_ARR(3);
RB <= ROUT_ARR(2);
RA <= ROUT_ARR(1);

end process;
end light_case;