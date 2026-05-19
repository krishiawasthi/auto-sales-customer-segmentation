install.packages("conjoint")
install.packages("dplyr")
install.packages("ggplot2")
library(conjoint)
library(dplyr)
library(ggplot2)
profiles <- expand.grid(
  ProductLine = c("Classic", "Motorcycles", "Planes", "Ships", "Trains", "Trucks", "Vintage"),
  MSRP = c(20, 50, 100, 150),   # Manufacturer's Suggested Retail Price
  PriceEach = c(15, 40, 90, 130) # Actual selling price
)
ratings <- sample(1:10, nrow(profiles), replace = TRUE)
conjoint_data <- cbind(profiles, Ratings = ratings)
utility_model <- lm(Ratings ~ ProductLine + MSRP + PriceEach, data = conjoint_data)
coeffs <- coef(utility_model)
importance <- sapply(levels(factor(names(coeffs)[-1])), function(attr) {
  range(coeffs[grepl(attr, names(coeffs))], na.rm = TRUE)
})
importance <- apply(abs(utility_model$utilities), 2, sum)
importance <- importance / sum(importance)  # Normalize values
print(importance) 
print(utility_model)
summary(utility_model)
importance <- abs(coef(utility_model)[-1])  # Exclude intercept
names(importance) <- names(coef(utility_model))[-1]
print(importance)
importance_df <- data.frame(
  Attribute = names(importance),
  Importance = importance
)
ggplot(importance_df, aes(x = Attribute, y = Importance, fill = Attribute)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  coord_flip() +
  labs(title = "Attribute Importance in Conjoint Analysis",
       x = "Attributes",
       y = "Importance Score")
