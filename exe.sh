#!/bin/bash

iverilog -g 2012 core/*.sv core/circuit/*.sv core/controller/*.sv core/datapath/*.sv memory/*.sv top.sv testbench/sim_test.sv 
