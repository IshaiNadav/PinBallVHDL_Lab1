library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ball_move is
	port(
			CLK : in std_logic;
			resetN : in std_logic;
			enable : in std_logic;
			bounce_enable : in std_logic;
			bounce_data : in std_logic_vector (1 downto 0);
			flipper_hit_enable : in std_logic;
			flipper_hit_data : in std_logic_vector (2 downto 0);
			is_dead : in std_logic;
			game_over : in std_logic;
			end_of_frame : in std_logic;
			currLocation_X : out integer;
			currLocation_Y : out integer
	);
end entity;


architecture arc_ball_move of ball_move is

		constant StartX : integer := 580;   -- starting point
		constant StartY : integer := 385;
		
		constant gravity : integer := 3;

		signal ObjectStartX_t : integer range 0 to 640;  --vga screen size 
		signal ObjectStartY_t : integer range 0 to 480;
		
		signal Ball_Movement_X : integer range -640 to 640;
		signal Ball_Movement_Y : integer range -480 to 480;

	begin
		
		currLocation_X <= ObjectStartX_t;
		currLocation_Y <= ObjectStartY_t;
		
		process (CLK, resetN, enable, bounce_enable, flipper_hit_enable, game_over, is_dead)
		begin
		if RESETn = '0' then
				ObjectStartX_t	<= StartX;
				ObjectStartY_t	<= StartY ;
		elsif rising_edge(CLK) then
			if (enable = '1' and game_over = '0') then
				if end_of_frame = '1' then
					if is_dead = '1' then
						ObjectStartX_t <= StartX;
						ObjectStartY_t <= StartY;
					else
						ObjectStartX_t  <= ObjectStartY_t + Ball_Movement_X;  -- move X 
						ObjectStartY_t  <= ObjectStartY_t + Ball_Movement_Y; -- move Y
					end if;
				end if;
				
				if (flipper_hit_enable = '1') then			-- flipper hit movement.
				
				elsif (bounce_enable = '1') then				-- usual movement enable.
					case bounce_data is 
						when "00" =>	-- died. (hit the bottom)
						
						when "01" => 	-- horizontal wall
							Ball_Movement_Y <= -Ball_Movement_Y;
							
						when "10" =>	-- vertical wall
							Ball_Movement_X <= -Ball_Movement_X;
							
						when "11" => 	-- wall edge.
							Ball_Movement_X <= -Ball_Movement_Y;
							Ball_Movement_Y <= -Ball_Movement_X;		-- no need of temp value cause the change is on rising edge.
					end case;
				else
						Ball_Movement_Y <= Ball_Movement_Y - gravity;	-- usual movement. Gravity.
					
				end if;
				
			end if;
		end if;
		end process;
end architecture;