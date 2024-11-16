#!/bin/bash

set -e

iverilog -g 2012 ../src/core/*.sv ../src/core/circuit/*.sv ../src/core/controller/*.sv ../src/core/datapath/*.sv ../src/memory/*.sv sim_test.sv

vvp a.out

gtkwave sim.vcd
