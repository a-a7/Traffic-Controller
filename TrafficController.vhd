library ieee;
use ieee.std_logic_1164.all;

entity trafficController is
    port (
    reset_n, clock  : in std_logic;
    buttonNS    : in std_logic;     --Pedestrian button North & Southbound
    redNS, yellowNS, greenNS, leftNS    : out std_logic;    --Traffic lights North & Southbound
    buttonEW    : in std_logic;     --Pedestrian button East & Westbound
    redEW, yellowEW, greenEW, leftEW    : out std_logic    --Traffic lights East & Westbound
    );
end entity;

architecture behaviour of trafficController is
    type statetype is (NSL, NSG, NSY, R, EWL, EWG, EWY); --States (NS = North & Southbound, EW = East & Westbound, L = Left Green Light, G = Green Light, Y = Yellow Light)
    signal state    : statetype;
    signal afterRed : std_logic;

--High level specification
begin
    the_fsm: process(clock, reset_n)
    begin
        if (reset = '0') then
            afterRed <= '0';
            state <= NSL;
        elsif (clk'event and clk = 1) then
            case state is
                when NSL =>
                    state <=NSG;
                when NSG =>
                    state <= NSY;
                when NSY =>
                    afterRed <= '0';
                    state <= R;
                when R =>
                    if afterRed = '0' then
                        state <= EWL;
                    else
                        state <= NSL;
                    end if;
                when EWL =>
                    state <= EWY;
                when EWY =>
                    afterRed = '1';
                    state <= R;
            end case;
        elsif (buttonNS = '1') then
            state <= NSL;
        elsif (buttonEW = '1') then
            state <= EWL;
        end if;
    end process;

    --Outputs
    redNS <= '1' when state = R
    else '0';
    yellowNS <= '1' when state = NSY
    else '0';
    greenNS <= '1' when state = NSG
    else '0';
    leftNS <= '1' when state = NSL
    else '0';

    redEW <= '1' when state = R
    else '0';
    yellowEW <= '1' when state = EWY
    else '0';
    greenEW <= '1' when state = EWG
    else '0';
    leftEW <= '1' when state = EWL
    else '0';

end architecture;