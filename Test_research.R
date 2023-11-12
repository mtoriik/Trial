install.packages(c("ggplot2", "ggpubr", "tidyverse", "broom", "AICcmodavg"))


library("ggplot2")
library("dplyr")
library("ggpubr")
library("tidyverse")
library("broom")
library("AICcmodavg")

#excel table
Germling_Death_AllFlow
#print(typeof(Germling_Death_AllFlow))
#print(Germling_Death_AllFlow[25])                           

#convert the list of the excel table data into a dataframe
df <- data.frame(AllFlow_Formatted)
print(df)
df_no_death <- df[-c(135:144),]
df_no_death$Percent_Death[df_no_death$Percent_Death == 0.1] <- 9.1
#colnames(df)[1] <- 'Strain_Condition'
colnames(df_no_death)[3] <- 'Percent_Death'
print(df_no_death)
first_column_name <- df_columns[1]
second_column_name <- df_columns[2]
print(first_column_name)

#plotting of the averaged data
options(repr.plot.width = 0.5, repr.plot.height = 0.5)
plot = ggplot(data = df_no_death,  na.rm = TRUE, mapping = aes(x = factor(Strain, level = c('Conidia', 'WT','Δ1', 'Δ4', 'Δ5', 'Δ6', 'Δ7', 'Δ8', 'Δ9', 'Δ10', 'Δ11', 'Δ12', 'Δ13', 'Δ14')), y = Percent_Death, fill = Condition,
                                                               )) +
  geom_boxplot() +
  scale_fill_manual(values = c('lightblue', 'purple', 'pink')) +
  labs(y = '% Death (Germlings)', x = 'Strain') +
  ggtitle('% Death (Germlings) for 11 NLR-like KO Strains')


  
plot
ggsave('finalplot.png', width = 20, height = 10, units = 'cm')


#statistical tests
t.test(df_no_death ~ Condition) #value column by treatment column
