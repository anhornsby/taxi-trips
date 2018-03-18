# Loop over drives to create a dataset of multiple drives

require(plyr)
path <- "/Users/adamhornsby/Documents/University/Kaggle-Other/AXATelematic/"
setwd(path)

# drivers = list.files(paste0(path,'drivers/'))

driver <- 1
tripsFiles <- paste0(path,'drivers/',driver,"/",1:200,".csv")
# Read in those files
trips <- llply(tripsFiles,read.csv,header=TRUE,stringsAsFactors=FALSE)  

df <- NULL
for (i in 1:length(trips)) {
  df <- rbind(df, cbind(trips[[i]], rep(i,nrow(trips[[i]]))))
}
colnames(df) <- c('x','y','drive')

# Export
write.csv(df, 'multi.csv')
