# main script

# installations
install.packages("tidyverse")

# libraries
library(readxl)


data <- read_excel("./data/PW Client Risk Assessment Results Coded_cleaned.xlsx")

# Turn unanswered 999s into 0s
drug_use_columns <- c("30A","30B","30C","30D","30E","30F","30G","30H","30I","30J")
for(val in drug_use_columns) {
  data[val][data[val] > 998] <- 0
}

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

summary(data)

# method 2 for creating a data frame
# test <- data[,c("Client Number","1","5","8","10","13","27","28","35","37","38")]
