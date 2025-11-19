library(here)
library(dplyr)

#Identify this script's location
here::i_am("code/01_make_table1.R")

#Read COVID data
df <- read.csv(here::here("data", "covid_sub.csv"))

#Classification summary table
classification_summary <- df |>
  count(CLASIFFICATION_FINAL, name = "n") |>
  mutate(percent = n / sum(n))

#Save output table
write.csv(
  classification_summary,
  here::here("output", "tables", "classification_summary.csv"),
  row.names = FALSE
)

print("classification_summary.csv saved successfully")
