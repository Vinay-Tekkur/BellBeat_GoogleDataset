Question
1) Is Activities effect number of Calories

# Installing Required Packages
install.packages("tidyverse")

# Loading installed library
library(tidyverse)

# Loading first few records of daily activity
head(dailyActivity_merged)

daily_calories_data <- read.csv("dataset/dailyCalories_merged.csv")
head(daily_calories_data)
colnames(dailyActivity_merged)
colnames(daily_calories_data)

# Relationship between TotalDistance and Tracker Distance with 
ggplot(data=dailyActivity_merged) + 
  geom_point(mapping = aes(x = TotalDistance, y = TrackerDistance)) + 
  labs(title = "Total Distance by User Vs. Tracker Total Distance", subtitle = "Here we tracking distance travlled by user and distance collected by traker",
       x = "Total Distance", y = "Tracker Distance")

# Relationships between Total distance Vs Calories
ggplot(data=dailyActivity_merged) + 
  geom_point(mapping = aes(x = TotalDistance, y = Calories)) + 
  labs(title = "Total Distance by User Vs. Calories", subtitle = "Here collecting data from Total distance travelled by user Vs Calories lost",
       x = "Total Distance")

# Relationshis between weight and Activity
weightLogInfo_merged <- read_csv("dataset/weightLogInfo_merged.csv")
colnames(weightLogInfo_merged)
head(weightLogInfo_merged)

## Understanding some summary statistics
How many unique participants are there in each dataframe? It looks like there may be more participants in the daily activity dataset than the weightLogInfo_merged dataset.
n_distinct(dailyActivity_merged$Id)
n_distinct(weightLogInfo_merged$Id)

nrow(dailyActivity_merged)
nrow(weightLogInfo_merged)

colnames(dailyActivity_merged)
colnames(weightLogInfo_merged)

head(dailyActivity_merged)
head(weightLogInfo_merged)

dailyActivity_merged %>%
  select(TotalSteps, TotalDistance) %>%
  summary()

weightLogInfo_merged %>%
  select(WeightKg, WeightPounds, BMI) %>%
  summary()

combined_data <- merge(weightLogInfo_merged, dailyActivity_merged, by="Id")
View(combined_data)
n_distinct(combined_data$Id)
duplicated(combined_data)

ggplot(data=combined_data) + 
  geom_smooth(mapping = aes(x = TotalDistance, y = WeightKg)) + 
  labs(title = "Total Distance by User Vs. Weight in Kg", subtitle = "Here collecting data from Total distance travelled by user Vs Weight of user",
       x = "Total Distance",
       y = "Weight in Kg")

ggplot(data=combined_data) + 
  geom_smooth(mapping = aes(x = TotalDistance, y = WeightPounds)) + 
  labs(title = "Total Distance by User Vs. Weight in pounds", subtitle = "Here collecting data from Total distance travelled by user Vs Weight of user in pounds",
       x = "Total Distance",
       y = "Weight in pounds")

ggplot(data=combined_data) + 
  geom_smooth(mapping = aes(x = TotalDistance, y = BMI)) + 
  labs(title = "Total Distance by User Vs. BMI", subtitle = "Here collecting data from Total distance travelled by user Vs BMI",
       x = "Total Distance",
       y = "BMI")

View(dailyActivity_merged)
