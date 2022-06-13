library(Pareto)
library(ggplot2)
library(gridExtra)


set.seed(100)
Data=data.frame(x.n=rnorm(50000),x.p=rPareto(50000,t=1,alpha=2))
summary(Data)

P = ggplot(data = Data, mapping = (aes(x.n)))

p1 = P+geom_histogram(bins=20, color="black",fill="grey") +
  geom_vline(aes(xintercept=mean(x.n)),
             color="blue", size=1) +
  geom_vline(aes(xintercept=median(x.n)),
             color="red", linetype="dashed", size=1)

p2 = P+geom_boxplot()
grid.arrange(p1, p2, nrow = 2)
mean(Data$x.n)
sd(Data$x.n)
