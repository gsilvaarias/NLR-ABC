all_prior <- data.frame()

  sim_stats <- read.table("all_prior.txt",h=T)
  sim_stats.pi <- sim_stats[,21:ncol(sim_stats)]/1040
  
  start <- 15
  end <- ncol(sim_stats.pi)
  
  all_Fst <- data.frame(rep=1:nrow(sim_stats.pi))
  for (i in start:end){
    print(i)
    name <- names(sim_stats.pi[i])
    sfirst <- gsub("pi_","",name)
    scols <-as.numeric(strsplit(sfirst,"[.]")[[1]])
    col1 <- scols[1]
    col2 <- scols[2]
    Fst <- (sim_stats.pi[,i] - (sim_stats.pi[,col1]+sim_stats.pi[,col2])/2)/sim_stats.pi[,i]
    all_Fst[,paste0("Fst_",sfirst)] <- Fst
    rm(name,sfirst,scols,col1,col2,Fst)
  }
  sim_stats <- cbind(sim_stats[,1:16], sim_stats.pi[,1:14], all_Fst[,2:ncol(all_Fst)])
  all_prior <- rbind(all_prior,sim_stats)
  rm(sim_stats,sim_stats.pi,start,end,all_Fst)

all_prior <- all_prior[complete.cases(all_prior), ]
write.table(all_prior, 'all_param_SuSt_prior.txt', col.names = T, quote = F, row.names = F, sep = '\t')

