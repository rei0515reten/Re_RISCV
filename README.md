# Re_RISCV
RISC-V based cpu processor

## IcarusVerilogシミュレーション
### コンパイル(systemVerilog)
```
 iverilog -g 2012 <module file>.v <testbench>.v
```
オプション：https://tanakatarou.tech/627/

### シミュレーション
```
vvp a.out
```

### シミュレーション（波形）
```
gtkwave <シミュレーション時に出力されるファイル>.vcd
```
