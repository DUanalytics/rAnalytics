#missing Value Imputation

pacman::p_load(mice, VIM, ggplot2, tidyverse)

df= sleep
df

missing_by_column <- df %>% 
  is.na %>% # check if each cell is na
  as_data_frame %>% # convert to data-frame
  mutate(row_number = 1:nrow(.)) %>% # add a column with the row number
  gather(variable, is_missing, -row_number) # turn wide data into narrow 
data

ggplot(missing_by_column, aes(x = variable, y = row_number, fill = is_missing)) +  geom_tile() +    theme_minimal() +   scale_fill_grey(name = "",labels = c("Present","Missing")) +  theme(axis.text.x  = element_text(angle=45, vjust=0.5, size = 8)) +   labs(x = "Variables in Dataset", y = "Rows / observations")


# initialize an empty model to take the parameters from
empty_model <- mice(df, maxit=0) 
empty_model
method <- empty_model$method
predictorMatrix <- empty_model$predictorMatrix

# first make a bunch of guesses...
imputed_data <- mice(df, method, predictorMatrix, m=5)
# then pick one for each variable
imputed_data <- complete(imputed_data)
