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
# Rename columns
testable_data <- testable_data %>%
  rename(
    age = data..1.,
    schooling = data..5.,
    housing = data..8.,
    jail = data..10.,
    health_care = data..13.,
    domestic_abuse = data..27.,
    career_duration = data..28.,
    female_partners = data..35.,
    male_partners = data..37.,
    unprotected_male = data..38.
  )

colnames(testable_data)
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
a <- ggplot(testable_data, aes(x = testable_data$data..5.))
a + geom_histogram(bins = 5, color = "black", fill = "gray")

# density plot with dotted line for mean
# age
age_density <- ggplot(testable_data, aes(x = testable_data$age))
age_density + geom_density() +geom_vline(aes(xintercept = mean(testable_data$age)), linetype = "dashed", size = 0.6) + ggtitle("Client Age") +
    labs(x="Age", y="")


# density plot with dotted line for mean
# career duration
career_density <- ggplot(testable_data, aes(x = testable_data$career_duration))
career_density + geom_density() +geom_vline(aes(xintercept = mean(testable_data$career_duration)), linetype = "dashed", size = 0.6) + ggtitle("Time in Occupation") +
  labs(x="Years", y="")

# density plot with dotted line for mean
# female partners
female_density <- ggplot(testable_data, aes(x = testable_data$female_partners))
female_density + geom_density() +geom_vline(aes(xintercept = mean(testable_data$female_partners)), linetype = "dashed", size = 0.6) + ggtitle("Female Partners") +
  labs(x="Number of Partners", y="")

# density plot with dotted line for mean
# male partners
male_density <- ggplot(testable_data, aes(x = testable_data$male_partners))
male_density + geom_density() +geom_vline(aes(xintercept = mean(testable_data$male_partners)), linetype = "dashed", size = 0.6) + ggtitle("Male Partners") +
  labs(x="Number of Partners", y="")

# histogram 
# schooling
schooling_histogram <- ggplot(testable_data, aes(x = testable_data$schooling))
schooling_histogram + geom_histogram(bins = 5, color = "black", fill = "blue") +
  ggtitle("Level of Schooling") +
  labs(x="", y="")

# histogram 
# domestic violence
domestic_histogram <- ggplot(testable_data, aes(x = testable_data$domestic_abuse))
domestic_histogram + geom_histogram(bins = 3, color = "black", fill = "red") +
  ggtitle("Domestic Abuse") +
  labs(x="Type of Abuse Faced", y="")

# Pie chart 
# Housing
lbl <- c("unstable", "stable")
housing <- table(testable_data$housing)
pie(housing, labels=lbl, main="Housing in the Past 6 Months")


# Pie chart 
# Jail
lbl <- c("jail", "no jail")
housing <- table(testable_data$jail)
pie(housing, labels=lbl, col=rainbow(length(lbl)), main="Spent Time in Prison")

summary(testable_data)