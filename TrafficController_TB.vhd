LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY trafficController_TB IS
--empty
END ENTITY;

ARCHITECTURE behaviour of trafficController_TB IS
    COMPONENT TrafficController
	PORT (
		reset, clock : IN std_logic;
		buttonNS : IN std_logic; --Pedestrian button North & Southbound
		redNS, yellowNS, greenNS, leftNS : OUT std_logic; --Traffic lights North & Southbound
		buttonEW : IN std_logic; --Pedestrian button East & Westbound
		redEW, yellowEW, greenEW, leftEW : OUT std_logic --Traffic lights East & Westbound
    );
    END COMPONENT;
    
    SIGNAL reset_TB, clock_TB : std_logic;
    SIGNAL buttonNS_TB : std_logic;
    SIGNAL redNS_TB, yellowNS_TB, greenNS_TB, leftNS_TB : std_logic;
    SIGNAL buttonEW_TB : std_logic;
    SIGNAL redEW_TB, yellowEW_TB, greenEW_TB, leftEW_TB : std_logic;

    BEGIN
    --DUT: Device Under Test
    DUT1 : TrafficController PORT MAP (
        reset => reset_TB,
        clock => clock_TB,
        buttonNS => buttonNS_TB,
        redNS => redNS_TB,
        yellowNS => yellowNS_TB,
        greenNS => greenNS_TB,
        leftNS => leftNS_TB,
        buttonEW => buttonEW_TB,
        redEW => redEW_TB,
        yellowEW => yellowEW_TB,
        greenEW => greenEW_TB,
        leftEW => leftEW_TB
    );

    --Clock process
    clock_process : PROCESS
    BEGIN
        clock_TB <= '0';
        wait for 10 ns;
        clock_TB <= '1';
        wait for 10 ns;
    END PROCESS;

    --Simulation
    Simluation : process
    BEGIN
        reset_TB <= '1'; buttonNS_TB <= '0'; buttonEW_TB <= '0';
        wait for 40 ns;
        reset_TB <= '0';
        wait for 200 ns;
        buttonNS_TB <= '1';
        wait for 40 ns;
        buttonNS_TB <= '0';
        wait for 200 ns;
        buttonEW_TB <= '1';
        wait for 40 ns;
        buttonEW_TB <= '0';
        wait;
    END PROCESS;

END ARCHITECTURE;