library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity ball_location_signal is
port 	(
		--////////////////////	Clock Input	 	////////////////////	
	   CLK  					: in std_logic;
		RESETn				: in std_logic;
		oCoord_X				: in integer;
		oCoord_Y				: in integer;
		fell_to_pit			: out std_logic ;
		game_started 		: out std_logic 
	);
end entity;


architecture behave of ball_location_signal is

	constant game_started_X_bound : integer := 560;
	constant fell_to_pit_right_X_bound : integer := 382;
	constant fell_to_pit_left_X_bound : integer := 188;
	constant fell_to_pit_upper_Y_bound : integer := 400;
	
	signal sigGameStarted : std_logic;
	signal sigFellToPit : std_logic;

begin
	game_started <= sigGameStarted;
	fell_to_pit <= sigFellToPit;
	process (CLK,RESETn)
	begin
		if RESETn = '0' then
			sigGameStarted <= '0';
			sigFellToPit <= '0';
		elsif rising_edge(CLK) then
			
			if (oCoord_X  <  game_started_X_bound) then
				sigGameStarted <= '1';
			else
				sigGameStarted <= '0';
			end if;
			
			if ( (oCoord_X > fell_to_pit_left_X_bound ) and  (oCoord_X < fell_to_pit_right_X_bound ) and  (oCoord_Y > fell_to_pit_upper_Y_bound) ) then
				sigFellToPit <= '1';
			else
				sigFellToPit <= '0';
			end if;	
		end if;
	end process;
end architecture;