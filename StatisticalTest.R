#Statistical Testing Code
#check for homoscendasity
#par(mfrow = c(2,2))
#plot(KO_1_Anova)
#par(mfrow = c(1,1))

df <- data.frame(OneWayAnova_FlowFormatted)
colnames(df)[1] <- 'Strain_Condition'
colnames(df)[2] <- 'Percent_Death'
print(df)

#KO1
KO_1_experiment <- df[c(1:35),]
print(KO_1_experiment)
KO_1_Anova <- aov(Percent_Death ~ Strain_Condition, data = KO_1_experiment)
summary(KO_1_Anova)
KO_1_Tukey <- TukeyHSD(KO_1_Anova)
KO_1_Tukey

#KO4
KO_4_experiment <- df[c(36:47),]
print(KO_4_experiment)
KO_4_Anova <- aov(Percent_Death ~ Strain_Condition, data = KO_4_experiment)
summary(KO_4_Anova)
KO_4_Tukey <- TukeyHSD(KO_4_Anova)
KO_4_Tukey

#KO5
KO_5_experiment <- df[c(48:59),]
print(KO_5_experiment)
KO_5_Anova <- aov(Percent_Death ~ Strain_Condition, data = KO_5_experiment)
summary(KO_5_Anova)
KO_5_Tukey <- TukeyHSD(KO_5_Anova)
KO_5_Tukey

#KO6
KO_6_experiment <- df[c(60:83),]
print(KO_6_experiment)
KO_6_Anova <- aov(Percent_Death ~ Strain_Condition, data = KO_6_experiment)
summary(KO_6_Anova)
KO_6_Tukey <- TukeyHSD(KO_6_Anova)
KO_6_Tukey

#KO7
KO_7_experiment <- df[c(84:94),]
print(KO_7_experiment)
KO_7_Anova <- aov(Percent_Death ~ Strain_Condition, data = KO_7_experiment)
summary(KO_7_Anova)
KO_7_Tukey <- TukeyHSD(KO_7_Anova)
KO_7_Tukey

#KO8
KO_8_experiment <- df[c(95:106),]
print(KO_8_experiment)
KO_8_Anova <- aov(Percent_Death ~ Strain_Condition, data = KO_8_experiment)
summary(KO_8_Anova)
KO_8_Tukey <- TukeyHSD(KO_8_Anova)
KO_8_Tukey

#KO9
KO_9_experiment <- df[c(107:118),]
print(KO_9_experiment)
KO_9_Anova <- aov(Percent_Death ~ Strain_Condition, data = KO_9_experiment)
summary(KO_9_Anova)
KO_9_Tukey <- TukeyHSD(KO_9_Anova)
KO_9_Tukey

#KO10
KO_10_experiment <- df[c(119:130),]
print(KO_10_experiment)
KO_10_Anova <- aov(Percent_Death ~ Strain_Condition, data = KO_10_experiment)
summary(KO_10_Anova)
KO_10_Tukey <- TukeyHSD(KO_10_Anova)
KO_10_Tukey

#KO11
KO_11_experiment <- df[c(131:142),]
print(KO_11_experiment)
KO_11_Anova <- aov(Percent_Death ~ Strain_Condition, data = KO_11_experiment)
summary(KO_11_Anova)
KO_11_Tukey <- TukeyHSD(KO_11_Anova)
KO_11_Tukey

#KO13
KO_13_experiment <- df[c(143:154),]
print(KO_13_experiment)
KO_13_Anova <- aov(Percent_Death ~ Strain_Condition, data = KO_13_experiment)
summary(KO_13_Anova)
KO_13_Tukey <- TukeyHSD(KO_13_Anova)
KO_13_Tukey


#KO14
KO_14_experiment <- df[c(155:166),]
print(KO_14_experiment)
KO_14_Anova <- aov(Percent_Death ~ Strain_Condition, data = KO_14_experiment)
summary(KO_14_Anova)
KO_14_Tukey <- TukeyHSD(KO_14_Anova)
KO_14_Tukey
