library(dplyr)

# Read tables

metadata=read.table(file="Saanich.metadata.txt", header=TRUE, row.names=1, sep="\t", na.strings="NAN")

otu=read.table(file="Saanich.OTU.txt", header=TRUE, row.names=1, sep="\t", na.strings="NAN")

# Select columns

metadata %>% 
  select(O2_uM)

metadata %>% 
  select(matches("O2|oxygen"))

metadata %>% 
  select(ends_with("V"))

metadata %>% 
  select(contains("SiO2"))

# Select rows

metadata %>% 
  filter(O2_uM == 0)

metadata %>% 
  filter(O2_uM == 0) %>% 
  select(Depth_m)

metadata %>% 
  filter(CH4_nM > 100, 
         Temperature_C < 10) %>% 
  select(c(Depth_m, CH4_nM, Temperature_C))

# Mutating data

metadata %>% 
  mutate(N2O_uM = N2O_nM/1000) # returns the whole table

metadata %>% 
  transmute(N2O_uM = N2O_nM/1000) # returns just the new var

metadata %>% 
  mutate(Std_N2O_uM = Std_N2O_nM/1000,
         Std_CH4_uM = Std_CH4_nM/1000,
         N2O_uM = N2O_nM/1000,
         CH4_uM = CH4_nM/1000) %>% 
  select(matches("N2O|CH4"))

# Sort

metadata %>% 
  arrange(O2_uM, Depth_m)

metadata %>% 
  arrange(Depth_m)

# Summarize

metadata %>% 
  summarize(min_depth = min(Depth_m),
            max_depth = max(Depth_m))
