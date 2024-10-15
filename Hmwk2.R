leprosy <- read.csv('Homework2_leprosy.csv')
library(ggplot2)

#1
#find the max leprosy cases in one country
(max(leprosy$New_Cases, na.rm = TRUE))

#create a new subset without NA in New Cases for Leprosy
leprosy_clean <- na.omit(leprosy)

#create new subset with only the max leprosy cases
max <- leprosy_clean[leprosy_clean$New_Cases >= 103819,]
max_country <- (max$population)
print(max_country)

#2
#create a new variable 'Per_100K'
leprosy_clean$Per_100K <- (leprosy_clean$New_Cases / leprosy_clean$Population) * 100000

#create a distribution
leprosy_ggplot <- ggplot(leprosy_clean)
leprosy_ggplot + geom_histogram(aes(x=Per_100K)) + 
  labs(title = 'Frequency of Leprosy Cases Per 100k People',
       x = 'Leprosy Cases Per 100k',
       y = 'Frequency')

#get summary statistics
fivenum(leprosy_clean$Per_100K)

#3
#Create A box plot for each region
leprosy_ggplot + geom_boxplot(aes(x=Region, y=Per_100K, fill=Region)) +
labs(title = 'Distribution of Leprosy Cases per 100K by Region',
       x = 'Region',
       y = 'Cases per 100K')

#4
#Create a scatter plot comparing leprosy cases per 100K and GDP in Billions
leprosy_ggplot + geom_point(aes(x=Per_100K,y=GDP_billions)) +
  labs(title='Leprosy Cases per 100K vs. GDP in Billions of a Country', 
       x='Leprosy Cases per 100K',
       y='GDP in Billions')

cor(leprosy_clean$Per_100K, leprosy_clean$GDP_billions)
