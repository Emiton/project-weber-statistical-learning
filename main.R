# main script

# installations
install.packages("tidyverse")

# libraries
library(readxl) 
library(tidyverse)


data <- read_excel("./data/PW Client Risk Assessment Results Coded_cleaned.xlsx")

# Turn unanswered 999s into 0s
drug_use_columns <- c("30A","30B","30C","30D","30E","30F","30G","30H","30I","30J")
for(val in drug_use_columns) {
  data[val][data[val] > 998] <- 0
}

# TODO: Get rid of data$11
# create subset of dataframe
testable_data <- data.frame(data$`Client Number`, data$`1`, data$`5`,
                            data$`8`, data$`10`, data$`13`,
                            data$`27`, data$`28`, data$`11`,
                            data$`35`, data$`37`, data$`38`)


# collapse all drug use cases into single column
testable_data$drug_use <- data$`30A` + data$`30B` + data$`30C`
                           + data$`30D`+ data$`30E`+ data$`30F`
                           + data$`30G`+ data$`30H`+ data$`30I`
                           + data$`30J` 

# start plotting
ggplot(testable_data, aes(testable_data$data..8.)) 
  + geom_violin() + geom_point()

# create pairwise plot of all variables
pairs(testable_data)

# Pie chart for question 8 (housing)
housing <- table(testable_data$data..8.)
pie(housing)

# Show amount of things in a variable
myBar <- ggplot(testable_data, aes(testable_data$data..8.)) + geom_bar(fill = "#0073C2FF")

# histogram with many different bars
a <- ggplot(testable_data, aes(x = testable_data$data..1.))
a + geom_histogram(bins = 30, color = "black", fill = "gray")

# density plot
b <- ggplot(testable_data, aes(x = testable_data$data..1.))
b + geom_density()

# pie chart for one column ??
# data spead for one feature ??

summary(testable_data)