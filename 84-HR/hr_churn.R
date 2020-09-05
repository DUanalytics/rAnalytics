#HR Analytics
#Employee churn is the overall turnover in an organization’s staff as existing employees leave and new ones are hired. The churn rate is usually calculated as the percentage of employees leaving the company over a specified time period. Although some staff turnover is inevitable, a high rate of churn is costly.


#https://medium.com/datadriveninvestor/hr-analytics-with-data-science-adc1649f4596
#predict the possible churn of employees in a firm. Using Data Science procedures, companies can predict employees who are likely to leave and also use Exploratory Data Analysis to find patterns that can inform reasons for which employees may decide to leave.
#Read newly saved file
attrition <- read.csv("data/attrition.csv", stringsAsFactors = T)
#Examine data structures
str(attrition)
#Lets start with some correlation relationships
library(polycor)
pacman::p_load(ggplot2, dplyr, reshape2)
attrition_corr <- hetcor(attrition)
attrition_corr

attrition_corr$correlations %>%   melt() %>%   ggplot(., aes(Var1, Var2, fill = value)) +  geom_tile() +   scale_fill_gradient(low = "grey", high = "darkred") +   geom_text(aes(Var1, Var2, label = round(value,2)), size = 2) +  labs(title = "Correlation Matrix", x = "Numeric column", y = "Numeric Column",  fill = "Coefficient Range") + theme(axis.text.x = element_text(vjust = 0.5, angle = 45), plot.title = element_text(face = "bold", hjust = 0.5)) 
#As seen above, this is a correlation analysis to examine relationships between the variables in the dataset.
#we take a look at the ratio of existing staff versus those who left:
#Lets examine the class 
attrition %>%   count(status) %>%  ggplot(., aes(status, n, fill = status)) +   geom_bar(stat = "identity") + ggtitle("Existing staffs vs Exits")

#Next, we move to examine the department with the highest number of employees: 
#Department with highest mumber of employess
attrition %>%   count(dept) %>%  ggplot(., aes(reorder(dept, n), n, fill = n)) +   geom_bar(stat = "identity") + coord_flip() + labs(title = "Deparment staff counts",   x = "Department")

#The sales department clearly has the highest number of staff, with the management department having the least number. With this information, we can attempt to take a look at the department with the highest churn:
#Lets examine the department who has more people who left
attrition %>%   count(status, dept) %>%   filter(status == "left") %>%  ggplot(., aes(reorder(dept,n), n, fill = n)) +   geom_bar(stat = "identity") +   coord_flip() +   ggtitle("Department with Largest Attrition Number") +   xlab("Department")

#It appears that there is a relationship between a department size and the attrition count for that department. To examine that relationship:
#relationship between department size and the churn size
cbind.data.frame(size = attrition %>% count(dept) %>%  select(n), churn = attrition %>%  count(status, dept) %>%  filter(status == "left") %>%  select(n))
#There is a relationship of 0.993

# look at the average working hours across all departments:
#Examine the average working hrs of each dept
attrition %>% group_by(dept) %>%  summarise(n = mean(average_montly_hours)) %>% ggplot(., aes(reorder(dept,n), n, fill = n)) + geom_bar(stat = "identity") +  coord_flip()

#The average working hours have an almost equal average across all departments. Examining the salary distribution across all departments may give us further insights into the dataset:
#Dept with the lowest salary range
attrition %>%  group_by(dept) %>% count(salary, sort = T) %>%  ggplot(., aes(reorder(dept, n), n, fill = salary)) +   geom_bar(stat = "identity") +   coord_flip() +  ggtitle("Salary range by department")


#It can be seen that all departments have a low salary more than other ranges, followed by the medium. The only department having a seeming par between medium and high salary range is the management department. To get deeper insights into churn in each department, it is important that one critically examines the ratio of existing employees and those who left individually by each department:
#ratio of people in a dept versus those who left
attrition %>% group_by(dept) %>% count(status) %>%  mutate(n2 = sum(n)) %>% mutate(n3 = n/n2) %>% ggplot(., aes(x = "", y = n3, fill = status)) +  geom_bar(stat = "identity", width = 2) + coord_polar(theta = "y") +   facet_wrap(~dept) + scale_fill_manual(values=c("#999999", "#E69F00"))


#his kind of visualization does is that it helps us remove the size and carefully take a look at the churn rate in each department. For example, the sales department has the highest number of employees, but the rate of churn is actually smaller compare to the HR department which has the second to least size. Proceeding to examine the average satisfaction level for each department:
#Satisfaction level by department
attrition %>% group_by(dept) %>%   summarise(level = mean(satisfaction_level)) %>%  ggplot(., aes(reorder(dept, level), level, fill = dept)) +  geom_bar(stat = "identity") + coord_flip() +  ggtitle("Satisfaction Level by Department")


#Now, we can look at the ratio of people who left or remained and the number of projects executed:
#Ratio of people who left and are remaining by the number of projects they conducted
attrition %>% 
  group_by(number_project) %>% 
  count(status) %>% 
  ggplot(., aes(factor(number_project), n, fill = status)) +
  geom_bar(stat = "identity")
attrition %>% 
  group_by(number_project) %>% 
  count(status) %>% 
  mutate(n2 = sum(n)) %>% 
  ungroup() %>% 
  mutate(n3 = n/n2) %>% 
  ggplot(., aes(x = "", y = n3, fill = status)) +
  geom_bar(stat = "identity", width = 2) +
  coord_polar(theta = "y") +
  facet_wrap(~number_project) +
  scale_fill_manual(values=c("#999999", "#E69F00"))


#This visual provides a lot of facts about people who left. We can see that people who have projects of 2, 6 and 7 counts have a greater tendency to leave. For example, everyone who has 7 projects left. How insightful!
#Taking it a step further, let us look at the average working hours of people existing and those who left:
  #People who left ap
  ggplot(attrition, aes(average_montly_hours, fill = status)) +
  geom_density(alpha = 0.1) +
  ggtitle("Average Working hours")

#This density provides a lot of information. People who left are being overworked and largely under-worked, while there is a fairly steady distribution for people who are current employees. It is safe to deduce that people who left are those largely under-worked and overworked.
#Finally, we examine the relationship between time spent in the company and the churn status:
  #Lets examine the time spent in the company
  attrition %>% 
  group_by(time_spend_company) %>% 
  count(status) %>% 
  mutate(n2 = sum(n)) %>% 
  ungroup() %>% 
  mutate(n3 = n/n2) %>% 
  ggplot(., aes(x = "", y = n3, fill = status)) +
  geom_bar(stat = "identity", width = 2) +
  coord_polar(theta = "y") +
  facet_wrap(~time_spend_company) +
  scale_fill_manual(values=c("#999999", "#E69F00")) +
  ggtitle("Time Spent in Company")

  
#The pie chart shows that, people who are likely to leave also fall in the range of 3–6 working years in the firm. Having all this information, firms can discern ways to make working more attractive for their employees.

# Machine Learning-----
#  The machine Learning script can be executed and the final score shows an accuracy of about 99% on the test data using a Random Forest model. An ensemble method was employed to find the best model, RF performed better but with a slightly longer computational time:
  
#This project has been able to manipulate an attrition dataset and provided actionable insights into deep problems an organization may be facing in terms of employee churn. It is of great importance, that the HR team takes the findings from the Analytical team to the stakeholders and profer measures to ensure efficient retaining culture.

    