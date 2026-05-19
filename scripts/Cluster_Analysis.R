library(tidyverse)
library(cluster)
library(factoextra)
library(dplyr)
library(ggplot2)

View(AutoSalesData)
head(AutoSalesData)

str(df)

df$DEALSIZE_ENCODED <- as.numeric(factor(df$DEALSIZE))
class(df)

df <- read.csv("~/Desktop/auto-sales-customer-segmentation/data/raw/Auto Sales data.csv", stringsAsFactors = FALSE)
colnames(df)  # Lists all column names
sum(is.na(df$DEALSIZE))
df$DEALSIZE_ENCODED <- as.numeric(factor(df$DEALSIZE))
table(df$DEALSIZE, df$DEALSIZE_ENCODED)
df_cluster <- df %>% select(SALES, QUANTITYORDERED, DAYS_SINCE_LASTORDER, DEALSIZE_ENCODED)
df_scaled <- scale(df_cluster)

wss <- sapply(1:10, function(k){
  kmeans(df_scaled, centers = k, nstart = 25)$tot.withinss
})


plot(1:10, wss, type = "b", pch = 19, frame = FALSE,
     xlab = "Number of Clusters (k)", ylab = "Within-cluster Sum of Squares",
     main = "Elbow Method for Optimal k")
set.seed(42)
optimal_k <- 3  # Adjust based on the Elbow curve
kmeans_model <- kmeans(df_scaled, centers = optimal_k, nstart = 25)

# Add cluster labels to the original dataset
df$Cluster <- as.factor(kmeans_model$cluster)

# View cluster distribution
table(df$Cluster)
fviz_cluster(kmeans_model, data = df_scaled,
             ellipse.type = "norm",
             geom = "point",
             palette = "jco",
             ggtheme = theme_minimal())
print(kmeans_model$centers)
