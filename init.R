install.packages("haven")
install.packages("tidyverse")
install.packages("ggplot2")
library(haven)
library(tidyverse)
library(ggplot2)
raw_data <- read_dta("inputs/data/gss2021.dta")
relevant_data <-
  raw_data %>%
  select(
    age,
    income,
    educ,
    partyid,
    polviews
  )
relevant_data_categories <-
  relevant_data %>%
  mutate(partyid = case_when( 
    partyid == 0 ~ "Democrat",
    partyid == 1 ~ "Democrat",
    partyid == 2 ~ "Independent",
    partyid == 3 ~ "Independent",
    partyid == 4 ~ "Independent",
    partyid == 5 ~ "Republican",
    partyid == 6 ~ "Republican",
    
  ))
relevant_data_categories <-
  relevant_data %>%
  mutate(polviews = case_when( 
    partyid == 1 ~ "Liberal",
    partyid == 1 ~ "Liberal",
    partyid == 2 ~ "Independent",
    partyid == 3 ~ "Independent",
    partyid == 4 ~ "Independent",
    partyid == 5 ~ "Conservative",
    partyid == 6 ~ "Conservative",
    
  ))
relevant_data %>% count(income)


