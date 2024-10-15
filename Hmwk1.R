#setting working directory
setwd("/Users/michael/Documents/SDS 313/wk2/hmwk")

#extracting data
bonds <- read.csv('Homework1_Bonds.csv')

#1 - How many bonds were carried/defeated
table(bonds$Result)

#1 - percentage of approved bonds across government types
approved <- bonds[bonds$Result == 'Carried',]
prop.table(table(approved$Type))

#2 - New Dataframe that combines Votes For and Votes Against
bonds$VotesTotal <- bonds$VotesFor + bonds$VotesAgainst

#2 - Information of the bond with the highest voter turnout

#find max votes
(max(bonds$VotesTotal))

#create new subset with only the max votes
max <- bonds[bonds$VotesTotal >= 1030414,]
max

#3 - new subset with only approved and 100+ votes
min <- bonds[bonds$VotesTotal >= 100 & bonds$Result == 'Carried',]

#3 - create variable that finds percentage of votes for in subset
min$PercentFor <- (min$VotesFor / min$VotesTotal) * 100

#3 - make a graph of the distribution of this variable
hist(min$PercentFor,
     main='Histogram of Approved Voting Percentage',
     xlab='Percentage of votes For',
     col='lightblue',
     xlim=c(50,100),
     ylim=c(0,1000))

fivenum(min$PercentFor)
mean(min$PercentFor)

#4 - Creating a scatterplot comparing cost and voting percentage for
plot(min$PercentFor,(min$Amount)/1000000,
     main='Voting Percentage For and Cost', 
     xlab='Percent For (%)',
     ylab='Cost in Millions of Dollars ($)',
     pch=20)


#4 - Finding the correlation between these two variables
cor(min$PercentFor, min$Amount)

#balls
