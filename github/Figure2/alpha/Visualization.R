setwd("C:/Users/23196/OneDrive/Desktop/属水平多样性")  ##  设置工作目录为C盘mywd文件夹
getwd()  ##  进入工作目录
getwd()
# Libraries
library(tidyverse)
library(hrbrthemes)
library(viridisLite)
library(viridis)
library(ggplot2)
library(magrittr)
# create a dataset
data <- read.table("shannon.txt", head=T, row.names=1)
data <- read.csv("Accuracy.csv",header = T)

# Plot

  ggplot(data, aes(x=Methods, y=Accuracy, fill=锘縂roup)) +
  geom_boxplot() +
  #scale_fill_viridis_d(discrete = T, alpha=0.6) +
   #geom_jitter(color="black", size=0.9, alpha=0.9) +
  #stat_summary(fun=mean, geom="point", shape=20, size=2, color="red", fill="red") +
  theme_bw()+
  ggtitle("Accuracy") +
  #scale_x_discrete(limits=c('D0.Con','D7.B.Con','D7.B.0.05','D7.B.1','D14.B.Con','D14.B.0.05','D14.B.1','D7.R.Con','D7.R.0.05','D7.R.1','D14.R.Con','D14.R.0.05','D14.R.1'))+
  xlab("")

# Violin basic
data %>%
  ggplot( aes(x=Methods, y=Accuracy, fill=锘縂roup)) +
  geom_violin() +
  geom_bar(stat="identity", alpha=.6, width=.4) +
  #scale_fill_viridis_d(discrete = TRUE, alpha=0.6, option="D") +
  #geom_jitter(color="black", size=1, alpha=0.9) +
  stat_summary(fun=mean, geom="point", shape=20, size=2, color="red", fill="red") +
  theme_bw()+
  ggtitle("Violin chart") +
  xlab("")

p <- data %>%
  ggplot( aes(x=Methods, y=Accuracy, fill=锘縂roup)) + 
  geom_boxplot()+
  xlab("Methods") +
  theme(legend.position="none") +
  xlab("")
p
#输出保存
ggsave('shannon.png', plot, width = 6, height = 5)

