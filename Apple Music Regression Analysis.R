# connnecting to SQL Server
con <- odbcConnect('portfolio', uid = '******', pwd = '********')
music <- sqlQuery(con, 'select * from music')

# statistical models
mean(music$`Play Duration Minutes`)
mode <- names(table(music$`Play Duration Minutes`))[which.max(table(music$`Play Duration Minutes`))]
mode
median(music$`Play Duration Minutes`)
var(music$`Play Duration Minutes`)
sd(music$`Play Duration Minutes`)


mins <- sqlQuery(con, 'select [Year],[Month],SUM([Play Duration Minutes]) as [Total Minutes],
RANK() over(partition by [Year], [Month] order by SUM([Play Duration Minutes]) desc) as [Rank]
from music
group by [Year],[Month]
order by [Total Minutes] desc')


#Quick visualizations with regression models
ggplot(mins, aes(Year, `Total Minutes`, color = Month)) +
  geom_point()

ggplot(mins, aes(Year, `Total Minutes`)) + 
  geom_point() + 
  geom_smooth(method = 'loess') +
  facet_wrap(~ Month)

cor(mins$`Total Minutes`,mins$Year)
