---
  title: "Final Project Basic Outline"
author: "Abdulaziz"
output: html_notebook
---
  
  This is an outline for your final project. You can follow this outline, or you can modify it as you see fit. Do what works best for your project. 

## Research Question 

My research data is student alcohol consumption. This dataset has columns indicating school, sex, age, family size, parents cohabitation status, mothers and fathers education, travel time from home to school, and number of past classes failed and etc. for all cases, which are students.  Using this data I want to find if there is any correlation between those variables and the alcohol consumption of students. Which factors influence the alcoholism among students the most, does alcohol influence the school work, and any other interesting trends and correlations that I can find. 

It is an interesting research, because as a college student I am eager to learn the insights of my own college life and what factors influence it and what are results I might expect from it.



## Data Processing 

#### Data Intake 

Include R code and written explanation to import your data set.

```{r}
library(tidyverse)
library(dcData)
DataTable <- read.csv("student-alcohol-consumption.csv")
head(DataTable)
```
To use the data, I just downloaded the data csv file from Kaggle website and used read.csv function to import it into the r environment.
#### Data Wrangling 

Include R code and written explanation for wangling your data (you can make multiple wrangled data sets). 

```{r}
# Alcohol consumption and failed classes count
AlcoholFClasses <-
  DataTable %>%
  group_by(failures) %>%
  summarise(meanAlcWeekday = mean(Dalc),
            meanAlcWeekend = mean(Walc))
AlcoholFClasses

# Alcohol consumption and age
AlcoholAge <-
  DataTable %>%
  group_by(age) %>%
  summarise(meanAlcWeekday = mean(Dalc),
            meanAlcWeekend = mean(Walc))
AlcoholAge

# Alcohol consumption by sex
AlcoholSex <-
  DataTable %>%
  group_by(sex) %>%
  summarise(meanAlcWeekday = mean(Dalc),
            meanAlcWeekend = mean(Walc))
AlcoholSex
```

This new wrangled data creates a table of the class failures as cases and mean alcohol consumption during weekday and during weekend, to see if there is a correlation.

The second wrangled data creates a table of ages as cases and mean alcohol consumption during the weekday and during the weekend.


## Data Visualization

Include R code and written explanation for your data visualization(s). You must have **at least** one. You may have more than one (I would encourage you to have more than one). 

```{r}
AlcoholFClasses %>%
  ggplot(aes(x=failures,y=(meanAlcWeekday+meanAlcWeekend))) +
  geom_bar(stat='identity',position='stack', width=.9) +
  labs(y= "Total alcohol week", x = "Failed classes")

AlcoholAge %>%
  ggplot(aes(x=age,y=(meanAlcWeekday+meanAlcWeekend))) +
  geom_bar(stat='identity',position='stack', width=.9) +
  labs(y= "Total alcohol week", x = "Age")

AlcoholSex %>%
  ggplot(aes(x=sex,y=(meanAlcWeekday+meanAlcWeekend), fill=sex)) +
  geom_bar(stat='identity',position='stack', width=.9) +
  labs(y= "Total alcohol week", x = "Sex")
```
```


## Conclusion

Answer your research question using the data sets and visualizations you created. 