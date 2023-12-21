iverilog -g2012 -o sa_cache  -c ../link/file_list.txt
vvp sa_cache
gtkwave sa_cache_tb.vcd &
