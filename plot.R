
library(ggplot2)

theme1 <- theme(axis.title = element_blank(),axis.ticks = element_blank(), legend.position = 'none', axis.text = element_blank())

#scatter
ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ,y=hwy, color = class)) + theme1 + scale_color_brewer(type='qual')


#jitter
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class), position = "jitter") + theme1

#line
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(method = 'lm') + theme1

#bar
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity),position = 'dodge',color='black') + 
  theme1


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = factor(1), fill= clarity),position = 'identity',width = 1) + coord_polar(theta = 'y', start = 0) + theme1  + 
  theme(panel.grid = element_blank())

##################################################
head(iris)

p <- ggplot(iris,aes(Petal.Length,Petal.Width))
p

ggplot(iris,aes(Sepal.Width,fill=Species)) + geom_histogram(binwidth=0.2, color = 'black') + theme1


ggplot(iris,aes(Sepal.Length,fill=Species)) + geom_density(position = position_fill()) + theme1

ggplot(iris,aes(fill=Species)) + geom_bar()

ggplot(iris,aes(Petal.Length,Petal.Width)) + geom_point() + theme_classic() + theme1

ggplot(diamonds, aes(cut)) + geom_bar(stat = 'stack') + theme1


ggplot(iris,aes(Petal.Length,Petal.Width)) + geom_point(aes(color=Species),color='blue') + theme_classic() + theme1

p <- ggplot(diamonds, aes(cut))
ggplot(diamonds, aes(x="",fill = clarity)) + geom_bar(position = 'identity',width = 1, color = 'white') + coord_polar('y',start =0) + theme1 + theme(panel.grid = element_blank())


ggplot(iris,aes(Sepal.Length, Sepal.Width)) + geom_point(aes(color=Species))+ geom_smooth(color='black', linetype = 'dashed') + theme1

ggplot(iris,aes(Species, Sepal.Width)) + geom_violin(aes(fill=Species), trim = FALSE) + geom_boxplot(width=0.1) + theme1

ggplot(iris, aes(Sepal.Width, fill=Species)) + geom_density(alpha=0.2) + theme1


library(reshape2)
library(RColorBrewer)

dat <- iris[,1:4]
cor <- cor(dat)

cor <- melt(cor)

cor

myPalette <- colorRampPalette(rev(brewer.pal(11, "Spectral")))
# Experimenting with a different palette /\

ggplot(cor,aes(Var1,Var2,fill=value)) + geom_tile(color = 'white') +
geom_text(aes(label = round(value,2)), color = "black", size = 4) + scale_fill_gradientn(colours = myPalette(50)) + theme1

plotmatrix(dat)
