LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY trafficController IS
	PORT (
		reset, clock : IN std_logic;
		buttonNS : IN std_logic; --Pedestrian button North & Southbound
		redNS, yellowNS, greenNS, leftNS : OUT std_logic; --Traffic lights North & Southbound
		buttonEW : IN std_logic; --Pedestrian button East & Westbound
		redEW, yellowEW, greenEW, leftEW : OUT std_logic --Traffic lights East & Westbound
	);
END ENTITY;

ARCHITECTURE behaviour OF trafficController IS
	TYPE statetype IS (NSL, NSG, NSY, R, EWL, EWG, EWY); --States (NS = North & Southbound, EW = East & Westbound, L = Left Green Light, G = Green Light, Y = Yellow Light)
	SIGNAL theState : statetype;
	SIGNAL afterRed : std_logic;

	--High level specification
BEGIN
	PROCESS (clock, reset, afterRed, buttonNS, buttonEW)
	BEGIN
		IF reset = '1' THEN
			theState <= NSL;
		ELSIF clock'EVENT AND clock = '1' THEN
			CASE theState IS
				WHEN NSL => 
					theState <= NSG;
				WHEN NSG => 
					theState <= NSY;
				WHEN NSY => 
					afterRed <= '0';
					theState <= R;
				WHEN R => 
					IF afterRed = '0' THEN
						theState <= EWL;
					ELSE
						theState <= NSL;
					END IF;
				WHEN EWL => 
					theState <= EWG;
				WHEN EWG => 
					theState <= EWY;
				WHEN EWY => 
					afterRed <= '1';
					theState <= R;
			END CASE;
		ELSIF buttonNS = '1' THEN
			theState <= NSL;
		ELSIF buttonEW = '1' THEN
			theState <= EWL;
		ELSE
			NULL;
		END IF;
	END PROCESS;

	--Outputs
	redNS <= '1' WHEN theState = R
	         ELSE '0';
	yellowNS <= '1' WHEN theState = NSY
	            ELSE '0';
	greenNS <= '1' WHEN theState = NSG
	           ELSE '0';
	leftNS <= '1' WHEN theState = NSL
	          ELSE '0';

	redEW <= '1' WHEN theState = R
	         ELSE '0';
	yellowEW <= '1' WHEN theState = EWY
	            ELSE '0';
	greenEW <= '1' WHEN theState = EWG
	           ELSE '0';
	leftEW <= '1' WHEN theState = EWL
	          ELSE '0';

END ARCHITECTURE;