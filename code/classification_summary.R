library(here)
library(dplyr)
library(ggplot2)

#Identify this script's location
here::i_am("code/classification_summary.R")

#Read the COVID data
df <- read.csv(here::here("data", "covid_sub.csv"))

#Classification summary
classification_summary <- df |> 
  count(CLASIFFICATION_FINAL , name = "n") |>
  mutate(percent = n / sum(n))

#Save classification summary
write.csv(
  classification_summary,
  here::here("output", "tables", "classification_summary.csv"),
  row.names = FALSE
)

#Classification bar plot
p <- df |>
  count(CLASIFFICATION_FINAL) |>
  ggplot(aes(x = CLASIFFICATION_FINAL, y = n)) +
  geom_col() +
  labs(
    title = "Distribution of Case Classifications",
    x = "Classification",
    y = "Count"
  )

ggsave(
  here::here("output", "figures", "classification_distribution.png"),
  plot = p,
  width = 8, height = 5
)

print("classification_summary.csv saved")

