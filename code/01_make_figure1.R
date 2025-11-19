library(here)
library(dplyr)
library(ggplot2)

# Identify this script's location
here::i_am("code/01_make_figure1.R")

# Read COVID data
df <- read.csv(here::here("data", "covid_sub.csv"))

# Classification distribution plot
p <- df |>
  count(CLASIFFICATION_FINAL) |>
  ggplot(aes(x = CLASIFFICATION_FINAL, y = n)) +
  geom_col() +
  labs(
    title = "Distribution of Case Classifications",
    x = "Classification",
    y = "Count"
  )

# Save plot
ggsave(
  here::here("output", "figures", "classification_distribution.png"),
  plot = p,
  width = 8, height = 5
)

print("classification_distribution.png saved successfully")
