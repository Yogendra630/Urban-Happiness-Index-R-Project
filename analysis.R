
library(ggplot2)
library(dplyr)
library(corrplot)

data <- read.csv("urban_happiness.csv")

print(head(data))
print(summary(data))

data <- na.omit(data)

top_cities <- data %>% arrange(desc(Happiness)) %>% head(5)
print("Top Happiest Cities")
print(top_cities)

low_cities <- data %>% arrange(Happiness) %>% head(5)
print("Lowest Happiness Cities")
print(low_cities)

ggplot(data, aes(x = Happiness)) +
  geom_histogram(bins = 10, fill="skyblue") +
  ggtitle("Happiness Distribution")

ggplot(data, aes(x=Income, y=Happiness)) +
  geom_point(color="blue", size=3) +
  geom_smooth(method="lm") +
  ggtitle("Income vs Happiness")

ggplot(data, aes(x=Pollution, y=Happiness)) +
  geom_point(color="red", size=3) +
  ggtitle("Pollution vs Happiness")

numeric_data <- data[,2:8]
cor_matrix <- cor(numeric_data)
corrplot(cor_matrix, method="circle")

model <- lm(Happiness ~ Income + Pollution + Healthcare + Safety + Education + GreenSpace, data=data)
print(summary(model))
