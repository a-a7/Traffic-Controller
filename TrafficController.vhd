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
	TYPE statetype IS (NSL, NSG, NSY, NSR, EWL, EWG, EWY, EWR); --States (NS = North & Southbound, EW = East & Westbound, L = Left Green Light, G = Green Light, Y = Yellow Light)
	SIGNAL theState, nextState : statetype;

	--High level specification
BEGIN
	PROCESS (clock, reset, buttonNS, buttonEW)
	BEGIN
		IF clock'EVENT AND clock = '1' THEN
			IF reset = '1' THEN
				theState <= NSL;
			ELSIF buttonNS = '1' THEN
				theState <= NSL;
			ELSIF buttonEW = '1' THEN
				theState <= EWL;
			ELSE
				theState <= nextState;
			END IF;
		END IF;
	END PROCESS;
 
	--Next state logic
	PROCESS (theState)
		BEGIN
			CASE theState IS
				WHEN NSL => 
					nextState <= NSG;
				WHEN NSG => 
					nextState <= NSY;
				WHEN NSY => 
					nextState <= NSR;
				WHEN NSR => 
					nextState <= EWL;
				WHEN EWL => 
					nextState <= EWG;
				WHEN EWG => 
					nextState <= EWY;
				WHEN EWY => 
					nextState <= EWR;
				WHEN EWR => 
					nextState <= NSL;
			END CASE;
		END PROCESS;
 
		--Outputs
		redNS <= '1' WHEN theState = NSR OR theState = EWR
		         ELSE '0';
		yellowNS <= '1' WHEN theState = NSY
		            ELSE '0';
		greenNS <= '1' WHEN theState = NSG
		           ELSE '0';
		leftNS <= '1' WHEN theState = NSL
		          ELSE '0';

		redEW <= '1' WHEN theState = EWR OR theState = NSR
		         ELSE '0';
		yellowEW <= '1' WHEN theState = EWY
		            ELSE '0';
		greenEW <= '1' WHEN theState = EWG
		           ELSE '0';
		leftEW <= '1' WHEN theState = EWL
		          ELSE '0';
END ARCHITECTURE;