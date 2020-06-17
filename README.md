# Traffic-Controller

## Background
This project is to make a traffic controller on an FPGA using VHDL. The traffic controller will have buttons which pedestrians can press to change the lights to allow them to cross the street. The general idea of the physical system can be seen in Figure 1. A [Moore type finite state machine](https://en.wikipedia.org/wiki/Moore_machine) can be used for this system. The lights will be determined only by the state of the machine, thus making it Moore type fsm.

## Goals
This project will have the main VHDL file for digital system of the traffic controller. It will also contain a testbench file to verify the system. I also want to try using Python for verification, I will do this at the very end because I have never done that.

The VHDL code can be seen in *TrafficController.vhd*.
The testbench can be seen in *TrafficController_TB.vhd*.
If you have Quartus you can launch the project through *TrafficController.qpf*.

## Diagram
Figure 1: Physical representation of what the system might look like if I could build it on a PCB.
![](Diagram.png)

## Verification
Since I didn't know how to test using the testbench file *TrafficController_TB.vhd*, I had to manually use ModelSim to ensure the states the changing properly. The waveform can be seen in the following screenshot of ModelSim.
![](Waveform.png)

Update: I discovered to test *TrafficController_TB.vhd* you must open ModelSim. Then in the commands enter the following:

```
vcom -93 -work work {C:/____/Traffic Controller/TrafficController_TB.vhd}
vsim TrafficController_TB
add wave *
run 520ns
```

if you change the want to test from the beginning again enter:

```
restart
run 520ns
```