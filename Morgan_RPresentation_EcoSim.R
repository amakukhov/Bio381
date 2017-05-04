# EcoSimR Presentation
# 04/19/2017
# ADG

install.packages("EcoSimR")
install.packages("reshape2")
install.packages("MASS")

# EcoSimR - Null Model Analysis of Ecological Data
### History:
  # Diamond 1975:
    # (1) Forbidden species combinations (can't coexist due to interspecific competition)
    # (2) Checkerboard pairs of species (particular pairs of species may never co-occur together in nature due to interspecific competition)

  # Connor & Simberloff (1979):
    # Introduced null models into biogeographical data analysis
  # rows = species, columns = sites - presence/absence matrix (1s and 0s)

-----------------------
# CO-OCCURENCE INDICES:
-----------------------
  
# (1) CHECKER
# (2) C Score
# (3) V ratio
# (4) COMBO

  
-----------------------
  # NULL MODEL ALGORITHMS:
-----------------------
# 3 constraints raised to the power of 2 dimensions of matrix leads to 9 basic null models
  
#-------------------------------------------------------------------------------------------------
# (1) Create presence-absence matrix from species list data 

# read in associated species data 
sppDat <- read.table("AssociatedSppData_Serp.csv",header=TRUE,sep=",",stringsAsFactors = FALSE)
head(sppDat)

# reshape data using dcast function in reshape2 package
library(reshape2)
PA <- dcast(sppDat,formula=SpeciesName~SitePatch)
head(PA)

dim(PA)

#-------------------------------------------------------------------------------------------------
# (2) Conduct Species Co-occurrence Analysis using EcoSimR

### SIM9 null model algorithm- row and column sums fixed
## CHECKER index

library(EcoSimR)
library(MASS)
# Run null model with SIM9 algorithm & CHECKER index
adMod1 <- cooc_null_model(PA,algo= "sim9",metric="checker",nReps=1000,suppressProg=T)
# sim9 = both columns & rows are fixed (marginal totals are identical to the original matrix, only the content of the presence/absence are altered in the simulations)

# Summary and plots
summary(adMod1)


mean(adMod1$Sim)
plot(adMod1,type="hist") # the higher the index, the less co-occurence of the species (higher species segregation)
plot(adMod1,type="cooc")
plot(adMod1,type="burn_in")

----------------------
# C Score Index
----------------------
## Run null model with SIM9 algorithm and C score index
adMod2 <- cooc_null_model(PA,algo= "sim9",metric="c_score",nReps=1000)

# Summary and plots
summary(adMod2)
plot(adMod2,type="hist")
plot(adMod2,type="cooc")
plot(adMod2,type="burn_in")

----------------------
# COMBO Index
----------------------
# Run null model with SIM9 algorithm and COMBO index
adMod3 <- cooc_null_model(PA,algo= "sim9",metric="species_combo",nReps=1000)

# Summary and plots
summary(adMod3)
plot(adMod3,type="hist")
plot(adMod3,type="cooc")


### SIM2 null model algorithm- row sums fixed, columns equiprobable ###

----------------------
# CHECKER Index
 ----------------------
# Run null model with SIM2 algorithm and C score index
adMod4 <- cooc_null_model(PA,algo= "sim2",metric="c_score",nReps=1000)

# Summary and plots
summary(adMod4)
plot(adMod4,type="hist")
plot(adMod4,type="cooc")

----------------------
# C Score Index
----------------------
# Run null model with SIM2 algorithm and CHECKER index
adMod5 <- cooc_null_model(PA,algo= "sim2",metric="checker",nReps=1000)

# Summary and plots
summary(adMod5)
plot(adMod5,type="hist")
plot(adMod5,type="cooc")  
  
----------------------
# V Ratio Index
----------------------
# Run null model with SIM2 algorithm and V ratio index
adMod6 <- cooc_null_model(PA,algo= "sim2",metric="v_ratio",nReps=1000)

# Summary and plots
summary(adMod6)
plot(adMod6,type="hist")
plot(adMod6,type="cooc")

----------------------
# COMBO Index
----------------------
# Run null model with SIM2 algorithm and COMBO index
adMod7 <- cooc_null_model(PA,algo= "sim2",metric="species_combo",nReps=1000)

# Summary and plots
summary(adMod7)
plot(adMod7,type="hist")
plot(adMod7,type="cooc")
  
  
  
  
  
