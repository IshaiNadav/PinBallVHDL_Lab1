library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ball_move is
	port(
			CLK : in std_logic;
			resetN : in std_logic;
			enable : in std_logic;
			start_shot : in std_logic;
			bounce_enable : in std_logic;
			bounce_data : in std_logic_vector (4 downto 0);
			flipper_hit_enable : in std_logic;
			flipper_hit_data : in std_logic_vector (2 downto 0);
			is_dead : in std_logic;
			game_over : in std_logic;
			end_of_frame : in std_logic;
			ballSpeedX : out integer;
			ballSpeedY : out integer;
			currLocation_X : out integer;
			currLocation_Y : out integer
	);
end entity;


architecture arc_ball_move of ball_move is

		constant StartX : integer := 500;   -- starting point
		constant StartY : integer := 350;
		
		constant start_shot_speed : integer := -10;
		constant gravity : integer := 1;
		constant speed_devider : integer := 4;
		constant max_speed : integer := 12;
	
		signal game_started : std_logic;
		
		signal sigCurrLocationX : integer range 0 to 640;  --vga screen size 
		signal sigCurrLocationY : integer range 0 to 480;
		
		signal sigSpeedX : integer;
		signal sigSpeedY : integer;
		
		constant Y_FLOOR : integer := 449;
		constant BallDrawY_Size : integer := 27;

	begin
	
		currLocation_X <= sigCurrLocationX;
		currLocation_Y <= sigCurrLocationY;
		ballSpeedX <= sigSpeedX;
		ballSpeedY <= sigSpeedY;
		
		process (CLK, resetN)
		
		variable ObjectStartX_t : integer range 0 to 640;  --vga screen size 
		variable ObjectStartY_t : integer range 0 to 480;
		
		variable Ball_Movement_X : integer range -max_speed*speed_devider to max_speed*speed_devider;
		variable Ball_Movement_Y : integer range -max_speed*speed_devider to max_speed*speed_devider;
		variable temp : integer range -max_speed to max_speed;
		
		
		begin
		if RESETn = '0' then
				game_started <= '0';
				sigCurrLocationX	<= StartX;
				sigCurrLocationY	<= StartY ;
		elsif rising_edge(CLK) then
			if (enable = '1' and game_over = '0') then
				if end_of_frame = '1' then
					if is_dead = '1' or game_started = '0' then
						ObjectStartX_t := StartX;
						ObjectStartY_t := StartY;
					else
						ObjectStartX_t  := ObjectStartX_t + Ball_Movement_X/speed_devider;  -- move X 
						ObjectStartY_t  := ObjectStartY_t + Ball_Movement_Y/speed_devider; -- move Y
					end if;
				
					
					if start_shot = '0' then
							Ball_Movement_X := -7;--just for simulation
							Ball_Movement_Y := start_shot_speed*speed_devider;
							game_started <= '1';
					elsif (flipper_hit_enable = '1') then			-- flipper hit movement.
				
					elsif (bounce_enable = '1') then				-- usual movement enable.
						case bounce_data is 
							when "00000" =>	-- noBounce
							
							when "00001" => 	-- horizontal floor
								--if(Ball_Movement_Y > 0) then
									Ball_Movement_Y := -Ball_Movement_Y;
								--end if;
							when "00010" =>	-- left-down slope
									temp := Ball_Movement_X;
									Ball_Movement_X := abs(Ball_Movement_Y);
									Ball_Movement_Y := -abs(temp);
								
							when "00011" => 	-- left vertical wall.
								--if Ball_Movement_X < 0 then
									Ball_Movement_X := -Ball_Movement_X;
								--end if;
							when "00100" =>   -- left-up slope
								temp := Ball_Movement_X;
								Ball_Movement_X := abs(Ball_Movement_Y);
								Ball_Movement_Y := abs(temp);
							
							when "00101" =>   -- horizontal ceiling
								--if Ball_Movement_Y < 0 then
									Ball_Movement_Y := -Ball_Movement_Y;
								--end if;
							when "00110" =>	-- right-up slope
								temp := Ball_Movement_X;
								Ball_Movement_X := -abs(Ball_Movement_Y);
								Ball_Movement_Y := abs(temp);

							when "00111" =>	-- right vertical wall
							 --if Ball_Movement_X > 0 then
								Ball_Movement_X := -Ball_Movement_X;
							 --end if;
							when "01000" =>	-- right-down slope
									temp := Ball_Movement_X;
									Ball_Movement_X := -abs(Ball_Movement_Y);
									Ball_Movement_Y := -abs(temp);
							
							when others => null;
						end case;
					end if;
					
					if (Ball_Movement_X/speed_devider > max_speed) then
						Ball_Movement_X := max_speed*speed_devider;
					end if;
					if (Ball_Movement_Y/speed_devider > max_speed) then
						Ball_Movement_Y := max_speed*speed_devider;
					end if;
					if (Ball_Movement_X/speed_devider < -max_speed) then
						Ball_Movement_X := -max_speed*speed_devider;
					end if;
					if (Ball_Movement_Y/speed_devider < -max_speed) then
						Ball_Movement_Y := -max_speed*speed_devider;
					end if;
					
					sigCurrLocationX <= ObjectStartX_t;
					sigCurrLocationY <= ObjectStartY_t;	-- usual movement. Gravity.
					
					if (ObjectStartY_t + BallDrawY_Size < Y_FLOOR) then
						Ball_Movement_Y := Ball_Movement_Y + gravity;
					end if;
					
					sigSpeedX <= Ball_Movement_X;
					sigSpeedY <= Ball_Movement_Y;
					
				end if;--end of frame
				
				
			end if;--enabled/game over
		end if;--resetN/CLK
		
		

		
		end process;
end architecture;