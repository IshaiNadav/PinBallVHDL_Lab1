library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity objects_draw is
port 	(
		--////////////////////	Clock Input	 	////////////////////	
	   CLK  					: in std_logic;
		RESETn				: in std_logic;
		oCoord_X				: in integer;
		oCoord_Y				: in integer;
		--ObjectStartX		: in integer;
		--ObjectStartY 	: in integer;
		bounce_type 		: out std_logic_vector(1 downto 0) ;
		drawing_request	: out std_logic ;
		mVGA_RGB 			: out std_logic_vector(7 downto 0) 
	);
end entity;

architecture behav of objects_draw is 
	--floor:
	constant floor_start_x 	: integer := 10;
	constant floor_start_y 	: integer := 450;
	constant floor_X_size 	: integer := 620;
	constant floor_Y_size 	: integer := 10;
	constant floor_color  	: std_logic_vector(7 downto 0) := x"03";
	constant floor_bounce_type : std_logic_vector(1 downto 0) := "01";
	signal floor_end_x : integer;
	signal floor_end_y : integer;
	signal floor_drawing_X : std_logic := '0';
	signal floor_drawing_Y : std_logic := '0';
	signal floor_drawing_req : std_logic := '0';
	--/floor
	
	--right_wall:
	constant right_wall_start_x 	: integer := 620;
	constant right_wall_start_y 	: integer := 20;
	constant right_wall_X_size 	: integer := 10;
	constant right_wall_Y_size 	: integer := 440;
	constant right_wall_color  	: std_logic_vector(7 downto 0) := x"03";
	constant right_wall_bounce_type : std_logic_vector(1 downto 0) := "01";
	signal right_wall_end_x : integer;
	signal right_wall_end_y : integer;
	signal right_wall_drawing_X : std_logic := '0';
	signal right_wall_drawing_Y : std_logic := '0';
	signal right_wall_drawing_req : std_logic := '0';
	--/right_wall
	
	--left_wall:
	constant left_wall_start_x 	: integer := 10;
	constant left_wall_start_y 	: integer := 20;
	constant left_wall_X_size 	: integer := 10;
	constant left_wall_Y_size 	: integer := 440;
	constant left_wall_color  	: std_logic_vector(7 downto 0) := x"03";
	constant left_wall_bounce_type : std_logic_vector(1 downto 0) := "01";
	signal left_wall_end_x : integer;
	signal left_wall_end_y : integer;
	signal left_wall_drawing_X : std_logic := '0';
	signal left_wall_drawing_Y : std_logic := '0';
	signal left_wall_drawing_req : std_logic := '0';
	--/left_wall
	
	--ceiling:
	constant ceiling_start_x 	: integer := 10;
	constant ceiling_start_y 	: integer := 10;
	constant ceiling_X_size 	: integer := 620;
	constant ceiling_Y_size 	: integer := 10;
	constant ceiling_color  	: std_logic_vector(7 downto 0) := x"03";
	constant ceiling_bounce_type : std_logic_vector(1 downto 0) := "01";
	signal ceiling_end_x : integer;
	signal ceiling_end_y : integer;
	signal ceiling_drawing_X : std_logic := '0';
	signal ceiling_drawing_Y : std_logic := '0';
	signal ceiling_drawing_req : std_logic := '0';
	--/ceiling
	
	
	
	
	--All Purpose :
	signal sig_draw_req : std_logic := '0';
	signal sig_draw_data: std_logic_vector (7 downto 0);
	signal sig_bounce_type : std_logic_vec (1 downto 0);
	--signal bCoord_X : integer := 0;-- offset from start position 
	--signal bCoord_Y : integer := 0;

	

--		


begin

	-- Calculate objects end boundaries
	floor_end_x	<= floor_X_size + floor_start_x;
	floor_end_y	<= floor_Y_size + floor_start_y;
	
	ceiling_end_x	<= ceiling_X_size + ceiling_start_x;
	ceiling_end_y	<= ceiling_Y_size + ceiling_start_y;
	
	left_wall_end_x	<= left_wall_X_size + left_wall_start_x;
	left_wall_end_y	<= left_wall_Y_size + left_wall_start_y;
	
	right_wall_end_x	<= right_wall_X_size + right_wall_start_x;
	right_wall_end_y	<= right_wall_Y_size + right_wall_start_y;

-- Signals drawing_X[Y] are active when obects coordinates are being crossed

-- test if ooCoord is in the rectangle defined by Start and End 
	floor_drawing_X	<= '1' when  (oCoord_X  >= floor_start_x) and  (oCoord_X < floor_end_x) else '0';
   floor_drawing_Y	<= '1' when  (oCoord_Y  >= floor_start_y) and  (oCoord_Y < floor_end_y) else '0';
	if ( (floor_drawing_X ='1') and (floor_drawing_Y = '1') ) then
		sig_draw_req <= '1';
		sig_draw_data <= floor_color;
		sig_bounce_type <= floor_bounce_type;
	end if;
	
	ceiling_drawing_X	<= '1' when  (oCoord_X  >= ceiling_start_x) and  (oCoord_X < ceiling_end_x) else '0';
   ceiling_drawing_Y	<= '1' when  (oCoord_Y  >= ceiling_start_y) and  (oCoord_Y < ceiling_end_y) else '0';
	if ((ceiling_drawing_X ='1') and (ceiling_drawing_Y = '1') ) then
		sig_draw_req <= '1';
		sig_draw_data <= ceiling_color;
		sig_bounce_type <= ceiling_bounce_type;
	end if;	
	
	left_wall_drawing_X	<= '1' when  (oCoord_X  >= left_wall_start_x) and  (oCoord_X < left_wall_end_x) else '0';
   left_wall_drawing_Y	<= '1' when  (oCoord_Y  >= left_wall_start_y) and  (oCoord_Y < left_wall_end_y) else '0';
	if ((left_wall_drawing_X ='1') and (left_wall_drawing_Y = '1')) then
		sig_draw_req <= '1';
		sig_draw_data <= left_wall_color;
		sig_bounce_type <= left_wall_bounce_type;
	end if;
	
	right_wall_drawing_X	<= '1' when  (oCoord_X  >= right_wall_start_x) and  (oCoord_X < right_wall_end_x) else '0';
   right_wall_drawing_Y	<= '1' when  (oCoord_Y  >= right_wall_start_y) and  (oCoord_Y < right_wall_end_y) else '0';
	if ((right_wall_drawing_X ='1') and (right_wall_drawing_Y = '1')) then
		sig_draw_req <= '1';
		sig_draw_data <= right_wall_color;
		sig_bounce_type <= right_wall_bounce_type;
	end if;	
	

-- calculate offset from start corner 
	--bCoord_X 	<= (oCoord_X - floor_start_x) when ( floor_drawing_X = '1' and  floor_drawing_Y = '1'  ) else 0 ; 
	--bCoord_Y 	<= (oCoord_Y - floor_start_y) when ( floor_drawing_X = '1' and  floor_drawing_Y = '1'  ) else 0 ; 


process ( RESETn, CLK)

  		
   begin
	if RESETn = '0' then
	    mVGA_RGB	<=  (others => '0') ; 	
		drawing_request	<=  '0' ;

	elsif rising_edge(CLK) then
			mVGA_RGB	<=  sig_draw_data;	--get from colors table 
			drawing_request	<=  sig_draw_req ; -- get from mask table if inside rectangle
			bounce_type <= sig_bounce_type;
	end if;

  end process;

		
end architecture;	