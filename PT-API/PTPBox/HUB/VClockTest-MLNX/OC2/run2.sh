#!/bin/bash
export PTPCLOCK=/dev/ptp6
ip netns exec OC2 ./clockTest2 192.168.10.105 192.168.10.107 192.168.10.109 192.168.10.100 | tee OC2.log