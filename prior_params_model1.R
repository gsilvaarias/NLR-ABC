## create a matrix of prior parameter values of effective population size, divergence time, and migration rate from log-uniform distribution

library(KScorrect)

all_params <- c()
seq.length = 1040
mu = 1e-8 # constant mutation rate

for (i in 1:5000){
  Ne_C = rlunif(1, 5e3, 1e5) # log-uniform prior effective Central pop size
  Ne_N = rlunif(1, 0.1, 1) # log-uniform prior effective North pop size
  Ne_Co = rlunif(1, 0.1, 1) # log-uniform prior effective Coast pop size
  Ne_S = rlunif(1, 0.1, 1) # log-uniform prior effective South pop size
  Theta = 4*mu*Ne_C*seq.length
  tau_N = rlunif(1, 1e-3, 1)       # log-uniform prior North divergence time
  tau_Co = rlunif(1, 1e-3, 1)      # log-uniform prior Coast divergence time
  tau_S = rlunif(1, 1e-3, 1)  # log-uniform prior South divergence time
  mig_Ce = rlunif(1, 1e-2, 0.5) # log-uniform prior migration within Central region
  mig_N = rlunif(1, 1e-2, 0.5)  # log-uniform prior migration within North region
  mig_Co = rlunif(1, 1e-2, 0.5) # log-uniform prior migration within Coast region
  mig_S = rlunif(1, 1e-2, 0.5)  # log-uniform prior migration within South region
  mig_CeN = rlunif(1, 1e-2, mig_Ce)  # log-uniform prior migration between Central and North subpopulations
  mig_CeCo = rlunif(1, 1e-2, mig_Ce) # log-uniform prior migration between Central and Coastal subpopulations
  mig_CeS = rlunif(1, 1e-2, mig_Ce)  # log-uniform prior migration between Central and South subpopulations
  
  all_params <- rbind(all_params, c(Theta, Ne_C, Ne_N, Ne_S, Ne_Co, 
                                    tau_N, tau_Co, tau_S, 
                                    mig_Ce, mig_N, mig_Co, mig_S, 
                                    mig_CeN, mig_CeCo, mig_CeS))
  #  colnames(all_params) <- c('Theta', 'Ne_C', 'Ne_N', 'Ne_S', 'Ne_Co',
  #                       'tau_N', 'tau_Co', 'tau_S', 
  #                       'mig_Ce', 'mig_N', 'mig_Co', 'mig_S',
  #                       'mig_CeN', 'mig_CeCo', 'mig_CeS')
}
write.table(all_params, "all_params", col.names = F, row.names = F, quote = F, sep='\t')
