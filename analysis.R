#Cynthia Cisneros

# libraries
library(dplyr)
library(hrbrthemes)
library(usmap)
library(plotly)
library(ggplot2)
library(patchwork)

# incarceration dataframe from github
incarceration_df <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")

#Summary Information, cleaning and filtering
summary_info <- list()
summary_info$num_variable <- ncol(incarceration_df)
summary_info$division_data <- incarceration_df %>%
  distinct(division) %>%
  select(division)
summary_info$state_data <- incarceration_df %>%
  distinct(state) %>%
  select(state)
summary_info$region_data <- incarceration_df %>%
  distinct(region) %>%
  select(region)
summary_info$avg_total_jail_pop <- mean(incarceration_df$total_jail_pop, na.rm = TRUE)
summary_info$max_total_jail_pop_2018 <- incarceration_df %>%
  filter(year == max(year, na.rm = TRUE)) %>%
  filter(total_jail_pop == max(total_jail_pop, na.rm = TRUE)) %>%
  pull(total_jail_pop)
summary_info$max_white_jail_pop <- max(incarceration_df$white_jail_pop, na.rm = TRUE)
summary_info$min_white_jail_pop <- min(incarceration_df$white_jail_pop, na.rm = TRUE)
summary_info$max_black_jail_pop <- max(incarceration_df$black_jail_pop, na.rm = TRUE)
summary_info$min_black_jail_pop <- min(incarceration_df$black_jail_pop, na.rm = TRUE)
summary_info$diff_black_white_jail_pop <- summary_info$max_black_jail_pop - summary_info$max_white_jail_pop
summary_info$max_state_other_race_jail_pop <- incarceration_df %>%
  filter(state == max(state, na.rm = TRUE)) %>%
  filter(other_race_jail_pop == max(other_race_jail_pop, na.rm = TRUE)) %>%
  distinct(other_race_jail_pop) %>%
  pull(other_race_jail_pop)
summary_info$min_state_other_race_jail_pop <- incarceration_df %>%
  filter(state == min(state, na.rm = TRUE)) %>%
  filter(other_race_jail_pop == max(other_race_jail_pop, na.rm = TRUE)) %>%
  distinct(other_race_jail_pop) %>%
  pull(other_race_jail_pop)

# selects specific columns in data to get cities
urbanicity_jail <- na.omit(incarceration_df) %>%
  select(urbanicity, total_jail_pop, year)

# creates bar chart of jail populations
barchart <- urbanicity_jail %>%
  ggplot(aes(fill = urbanicity, y = total_jail_pop, x = year)) +
  geom_bar(position = "dodge", stat = "identity") +
  labs(fill = "Urban Cities") +
  scale_fill_discrete(labels = c("Rural", "Small", "Suburban", "Urban")) +
  ylab("Jail Population") +
  xlab("Years") +
  ggtitle("Total Jail Population across Cities") + 
  theme(plot.title = element_text(face = "bold", size = 16, hjust = 0.5)) +
  theme(axis.title.x.bottom = element_text(face = "bold")) +
  theme(axis.title.y.left = element_text(face = "bold"))
barchart

# selects white/black jail pop in regions
black_white_jail_pop_region <- na.omit(incarceration_df) %>%
  select(white_jail_pop, black_jail_pop, region)

# creates scatterplot for data above
scatterplot <- ggplot(black_white_jail_pop_region , aes(x = white_jail_pop, y = black_jail_pop, color=region)) + 
  geom_point(size=4) +
  labs(color = "Regions") +
  xlab("White") +
  ylab("Black") +
  ggtitle("Jail Population Across Regions") +
  theme(plot.title = element_text(face = "bold", size = 16, hjust = 0.5)) +
  theme(axis.title.x.bottom = element_text(face = "bold")) +
  theme(axis.title.y.left = element_text(face = "bold")) 
theme_ipsum() 
scatterplot

# selects state and other populations in jail
other_race_jail_pop_state <- na.omit(incarceration_df) %>%
  select(state, other_race_jail_pop)

# creates the US map with the data above
map <- plot_usmap(data = other_race_jail_pop_state, values = "other_race_jail_pop", labels = FALSE) +
  scale_fill_continuous(
    low = "blue", high = "red", name = "Jail Population of Non-Black or White", label = scales::comma
  ) + 
  theme_linedraw() +
  xlab("Longitude") +
  ylab("Latitude") +
  theme(legend.position = "right") +
  labs(title = "Non-Black or White Jail Population") +
  theme(plot.title = element_text(face = "bold", size = 16, hjust = 0.5)) +
  theme(legend.background = element_rect(fill="white",
                                         size=0.5, linetype ="solid", 
                                         colour ="black"))
map
