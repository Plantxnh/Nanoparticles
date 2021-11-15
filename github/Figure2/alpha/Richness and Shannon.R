#----------------------------------------------------------------
#以下是chao1指数的计算
library(vegan)
asv_table <- read.csv("virus.csv",row.names = 1,header = T)
asv_table = t(asv_table)
num_asv <- specnumber(asv_table)
num_asv
index = estimateR(asv_table)
index
write.csv(index,file = 'chao-genus.csv')

#----------------------------------------------------------------
#以下是香农指数

shannon_asv <- diversity(asv_table, index = 'shannon', MARGIN = 1)
shannon_asv
write.csv(shannon_asv, file = 'shannon-species.csv')

#----------------------------------------------------------------
#以下是simpson指数

simpson_asv <- diversity(asv_table, index = 'simpson', MARGIN = 1)
simpson_asv
write.csv(simpson_asv, file = 'simpson_asv.csv')


#----------------------------------------------------------------
#以下是Pielou指数

S <- specnumber(asv_table)
H <- diversity(asv_table,'shannon')
J <- H/log(S)
J
write.csv(J,file = 'Pielou.csv')
