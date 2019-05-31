# get atom masses
c_mass <- rcdk::get.formula("C")@mass
h_mass <- rcdk::get.formula("H")@mass
o_mass <- rcdk::get.formula("O")@mass
n_mass <- rcdk::get.formula("N")@mass
p_mass <- rcdk::get.formula("P")@mass
s_mass <- rcdk::get.formula("S")@mass

# general base masses
water_mass <- rcdk::get.formula("H2O")@mass

# get base masses (PCs)
gpc_mass <- rcdk::get.formula("C8H20NO6P")@mass
pc_mass <- rcdk::get.formula("C5H14NO4P")@mass
choline_mass <- rcdk::get.formula("C5H13NO")@mass

# get base masses (PEs)
gpe_mass <- rcdk::get.formula("C5H14NO6P")@mass
pe_mass <- rcdk::get.formula("C2H8NO4P")@mass
ethanolamine_mass <- rcdk::get.formula("C2H7NO")@mass

# get base masses (PSs)
gps_mass <- rcdk::get.formula("C6H14NO8P")@mass
ps_mass <- rcdk::get.formula("C3H8NO6P")@mass
serine_mass <- rcdk::get.formula("C3H7NO3")@mass

# get base masses (PGs)
gpg_mass <- rcdk::get.formula("C6H15O8P")@mass
pg_mass <- rcdk::get.formula("C3H9O6P")@mass
glycerol_mass <- rcdk::get.formula("C3H8O3")@mass

# get base masses (PIs)
gpi_mass <- rcdk::get.formula("C9H19O11P")@mass
pi_mass <- rcdk::get.formula("C6H13O9P")@mass
inositol_mass <- rcdk::get.formula("C6H12O6")@mass