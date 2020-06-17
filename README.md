# Traffic-Controller

## Background
This project is to make a traffic controller on an FPGA using VHDL. The traffic controller will have buttons which pedestrians can press to change the lights to allow them to cross the street. The general idea of the physical system can be seen in Figure 1. A [Moore type finite state machine](https://en.wikipedia.org/wiki/Moore_machine) can be used for this system. The lights will be determined only by the state of the machine, thus making it Moore type fsm.

This project will have the main VHDL file for digital system of the traffic controller. It will also contain a testbench file to verify the system. I also want to try using Python for verification so I will do that at the very end because I have never done that.

The VHDL code can be seen in TrafficController.vhd.
The testbench can be seen in TrafficController_TB.vhd.
If you have Quartus you can launch the project through TrafficController.qpf. 

## Diagram
Figure 1: Physical representation of what the system might look like if I could build it on a PCB.
![](Diagram.png)