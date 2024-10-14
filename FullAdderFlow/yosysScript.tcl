#read modules from verilog file 
read_verilog FA_RTL.v

#Elaborate design hierarchy
hierarchy -check -top FA

#translate processes to netlist
proc

# mapping cells to internal library
techmap

# helps cleanup redundant logic & prepares the design for better synthesis in later stages
opt

# reads the SkyWater 130nm PDK Liberty file
read_liberty -lib sky130_fd_sc_hd__tt_025C_1v80.lib

# maps the generic flip-flops (DFFs)to the specific flip-flops available in the SkyWater standard cell library.
dfflibmap -liberty sky130_fd_sc_hd__tt_025C_1v80.lib

#performs logic optimization and final technology mapping
abc -liberty sky130_fd_sc_hd__tt_025C_1v80.lib

# Writing the synthesized neltlist
write_verilog -noattr synthesizedFA.v