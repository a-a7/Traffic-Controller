library ieee;
use ieee.std_logic_1164.all;

entity trafficController is
    port (
    reset       : in std_logic;
    clock       : in std_logic;
    buttonNS    : in std_logic;     --Pedestrian button North & Southbound
    redNS       : out std_logic;    --Traffic lights North & Southbound
    yellowNS    : out std_logic;
    greenNS     : out std_logic;
    leftNS      : out std_logic;
    buttonEW    : in std_logic;     --Pedestrian button East & Westbound
    redEW       : out std_logic;    --Traffic lights East & Westbound
    yellowEW    : out std_logic;
    greenEW     : out std_logic;
    leftEW      : out std_logic
    );
end entity;

