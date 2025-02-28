#| label: loading required libraries

# ran quarto::quarto_use_template("wjschne/apaquarto", no_prompt = T) in console
#if (!requireNamespace("quarto", quietly = TRUE)) install.packages("tidyverse")
#if(!requireNamespace("tidyverse", quietly = TRUE)) install.packages("tidyverse")
#if (!requireNamespace("readr", quietly = TRUE)) install.packages("readr")
#if (!requireNamespace("forcats", quietly = TRUE)) install.packages("forcats")
#if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
#if (!requireNamespace("quarto", quietly = TRUE)) install.packages("quarto")
#if (!requireNamespace("knitr", quietly = TRUE)) install.packages("knitr")
#if (!requireNamespace("stringr", quietly = TRUE)) install.packages("stringr")
#if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")
#if (!requireNamespace("tidyr", quietly = TRUE)) install.packages("tidyr")
#if(!requireNamespace("scales", quietly = TRUE)) install.packages("scales")
#if (!requireNamespace("psych", quietly = TRUE)) install.packages("psych")
#if (!requireNamespace("stats", quietly = TRUE)) install.packages("stats")
#if (!requireNamespace("lme4", quietly = TRUE)) install.packages("lme4")
#if (!requireNamespace("patchwork", quietly = TRUE)) install.packages("patchwork")
#if (!requireNamespace("kableExtra", quietly = TRUE)) install.packages("kableExtra")
#if (!requireNamespace("rempsyc", quietly = TRUE)) install.packages("rempsyc")
#if (!requireNamespace("broom", quietly = TRUE)) install.packages("broom")
#if (!requireNamespace("papaja", quietly = TRUE)) install.packages("papaja")
#if (!requireNamespace("flextable", quietly = TRUE))install.packages("flextable")

library(quarto)
library(tidyverse)
library(readr)
library(forcats)
library(ggplot2)
library(quarto)
library(knitr)
library(stringr)
library(dplyr)
library(tidyr)
library(scales)
library(psych)
library(stats)
library(lme4)
library(patchwork)
library(kableExtra)
library(rempsyc)
library(broom)
library(papaja)
library(flextable)

#| label: setup

library(tidyverse)
set.seed(1234)

#| label: setting working directory

setwd("C:/Users/gabri/repos/SE-SCC-Depression/LocalOnly")
getwd()

#| label: reading in data

library(readr)
wave1_cohort1 <- readr::read_csv("Wave1_Cohort1.csv",
                          trim_ws = FALSE, 
                          name_repair = "minimal", 
                          col_types = cols(.default = col_character()))

#| label: inspecting the data

head(wave1_cohort1)
str(wave1_cohort1)
glimpse(wave1_cohort1)

#| label: cleaning the data

wave1_cohort1_clean <- wave1_cohort1 #%>%
  #rename_with(~ str_replace_all(., " ", "_")) %>%
  #mutate(across(everything(), trimws))

colnames(wave1_cohort1)

colnames(wave1_cohort1_clean)
  
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  rename(RosenbergQ1 = `Rosenberg Q1_1`, RosenbergQ2 = `Rosenberg Q1_2`, 
         RosenbergQ3 = `Rosenberg Q1_3`, RosenbergQ4 = `Rosenberg Q1_4`, 
         RosenbergQ5 = `Rosenberg Q1_5`, RosenbergQ6 = `Rosenberg Q1_6`, 
         RosenbergQ7 = `Rosenberg Q1_7`, RosenbergQ8 = `Rosenberg Q1_8`, 
         RosenbergQ9 = `Rosenberg Q1_9`, RosenbergQ10 = `Rosenberg Q1_10`) %>%
  rename(CESDQ1 = `CES-D Q1_1`, CESDQ2 = `CES-D Q1_2`, CESDQ3 = `CES-D Q1_3`, 
         CESDQ4 = `CES-D Q1_4`, CESDQ5 = `CES-D Q1_5`, CESDQ6 = `CES-D Q1_6`, 
         CESDQ7 = `CES-D Q1_7`, CESDQ8 = `CES-D Q1_8`, CESDQ9 = `CES-D Q1_9`, 
         CESDQ10 = `CES-D Q1_10`, CESDQ11 = `CES-D Q1_11`, CESDQ12 = `CES-D Q1_12`, 
         CESDQ13 = `CES-D Q1_13`, CESDQ14 = `CES-D Q1_14`, CESDQ15 = `CES-D Q1_15`, 
         CESDQ16 = `CES-D Q1_16`, CESDQ17 = `CES-D Q1_17`, CESDQ18 = `CES-D Q1_18`, 
         CESDQ19 = `CES-D Q1_19`, CESDQ20 = `CES-D Q1_20`)
#make sure to also clean SCC
#SCC was forgotten for cohort 1, it is included in wave 2, wave 3, and will be included in subsequent cohorts of wave 1

#for (col in colnames(wave1_cohort1_clean)) {
  #if (any(is.na(wave1_cohort1_clean[[col]]))) {
    #print(paste("Column", col, "has missing values"))
  #}}

#drop_na(RosenbergQ1) #do this within the pipeline of each questionnaire if there are nas to deal with

#wave1_cohort1_clean <- wave1_cohort1_clean %>%
  #pivot_longer(cols = starts_with("CESDQ"), names_to = "Question", values_to = "Response") %>%
  #group_by(Question) %>%
  #summarise(Mean_Response = mean(Response, na.rm = TRUE))

#| label: cleaning and scoring self-IAT

available.packages("iatgen")
install.packages("remotes")
remotes::install_github("iatgen/iatgen", force = TRUE)
library(iatgen)

wave1_cohort1_IAT <- read.csv("Wave1_Cohort1_SelfIAT.csv", header=T)

#collapsing IAT data down
wave1_cohort1_IAT$compatible.crit <- combineIATfourblocks(wave1_cohort1_IAT$Q4.RP4, wave1_cohort1_IAT$Q18.LP4, wave1_cohort1_IAT$Q14.RN7, wave1_cohort1_IAT$Q28.LN7)
wave1_cohort1_IAT$incompatible.crit <- combineIATfourblocks(wave1_cohort1_IAT$Q7.RP7, wave1_cohort1_IAT$Q21.LP7, wave1_cohort1_IAT$Q11.RN4, wave1_cohort1_IAT$Q25.LN4)

#collapsing IAT practice blocks
wave1_cohort1_IAT$compatible.prac<- combineIATfourblocks(wave1_cohort1_IAT$Q3.RP3, wave1_cohort1_IAT$Q17.LP3, wave1_cohort1_IAT$Q13.RN6, wave1_cohort1_IAT$Q27.LN6)
wave1_cohort1_IAT$incompatible.prac <- combineIATfourblocks(wave1_cohort1_IAT$Q6.RP6, wave1_cohort1_IAT$Q20.LP6, wave1_cohort1_IAT$Q10.RN3, wave1_cohort1_IAT$Q24.LN3)

#cleaning the IAT
clean <- cleanIAT(prac1=wave1_cohort1_IAT$compatible.prac, 
                  crit1=wave1_cohort1_IAT$compatible.crit, 
                  prac2=wave1_cohort1_IAT$incompatible.prac, 
                  crit2=wave1_cohort1_IAT$incompatible.crit, 
                  
                  timeout.drop=TRUE, 
                  timeout.ms=10000, 
                  
                  fasttrial.drop=FALSE, 
                  
                  fastprt.drop=TRUE, 
                  fastprt.percent=.10, 
                  fastprt.ms=300, 
                  
                  error.penalty=TRUE, 
                  error.penalty.ms=600)

sum(!clean$skipped) #how many participants completed the IAT (14)
clean$timeout.rate #timeout drop rate (% of trials) (0.004761905)
clean$fastprt.count #fast participant drop count and rate (% of sample) (0)
clean$fastprt.rate #" (0)
clean$drop.participant #if individual participants were dropped or not (All FALSE)
clean$error.rate #error rate (0.08911483)
clean$error.rate.pt #(NULL)
clean$error.rate.prac1 #error rate of practice combined block (0.05357143)
clean$error.rate.crit1 #error rate of critical combined block (0.06822262)
clean$error.rate.prac2 #(0.1223022)
clean$error.rate.crit2 #(0.1113106)
names(clean)
IATreliability(clean)$reliability #internal consistency (0.8902007)
IATalpha(clean)$alpha.total #reliability of IAT D-score (raw_alpha = 0.7397427)

wave1_cohort1_IAT$D <- clean$D
mean(clean$D, na.rm=T) #(0.7055081)
sd(clean$D, na.rm=T) #(0/3755495)
t.test(clean$D) #one sample t-test (t = 7.0291, df = 13, p-value = 8.945e-06, CI(0.4886723, 0.9223440), mean of x = 0.7055081)

mean(clean$D, na.rm=T) / sd(clean$D, na.rm=T) #cohen d (1.878)

# alternate way of calculating cohen's d

s_iat_cohens_d <- function(x, y) {
  mean_diff <- mean(x, na.rm = TRUE) - mean(y, na.rm = TRUE)
  pooled_sd <- sqrt((sd(x, na.rm = TRUE)^2 + sd(y, na.rm = TRUE)^2) / 2)
  return(mean_diff / pooled_sd)}

d_value <- s_iat_cohens_d(clean$D, rep(0, length(clean$D)))

# plotting IAT data

library(ggplot2)
ggplot(wave1_cohort1_IAT, aes(x=D))+
  geom_density(color="black", fill="light blue")+
  theme_light()

write.csv(clean$D, "SelfIATOutput.csv")

#reaction time descriptives by block
mean(clean$clean.means.crit1, na.rm=T) #(1028.404)
mean(clean$clean.means.crit2, na.rm=T) #(1396.257)
mean(clean$clean.means.prac1, na.rm=T) #(1114.787)
mean(clean$clean.means.prac2, na.rm=T) #(1487.6)
sd(clean$clean.means.crit1, na.rm=T) #(280.7861)
sd(clean$clean.means.crit2, na.rm=T) #(440.4245)
sd(clean$clean.means.prac1, na.rm=T) #(338.0655)
sd(clean$clean.means.prac2, na.rm=T) #(296.3132)

#| label: cleaning and scoring the CES-D

library(dplyr)

str(wave1_cohort1_clean$CESDQ2)
unique(wave1_cohort1_clean$CESDQ2)
table(wave1_cohort1_clean$CESDQ2, useNA = "always")


#recoding character responses to numeric values
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  mutate(across(starts_with("CESDQ"), ~ case_when(
    trimws(.) == "Rarely or none of the time (less than 1 day)" ~ 0,
    trimws(.) == "Some or a little of the time (1–2 days)" ~ 1,
    trimws(.) == "Occasionally or a moderate amount of time (3–4 days)" ~ 2,
    trimws(.) == "Most or all of the time (5–7 days)" ~ 3,
    is.na(.) ~ NA_real_,
    TRUE ~ NA_real_))) 

library(tidyverse)

#second option converting CES-D responses using forcats
levels(as.factor(wave1_cohort1_clean$CESDQ1)) #1

wave1_cohort1_clean <- wave1_cohort1_clean %>%
  mutate(across(starts_with("CESDQ"), ~ str_trim(.)))

wave1_cohort1_clean <- wave1_cohort1_clean %>% #this gives errors, fix!!
  mutate(across(starts_with("CESDQ"), ~ as.numeric(fct_recode(as.factor(.),
                                                   "0" = "Rarely or none of the time (less than 1 day)",
                                                   "1" = "Some or a little of the time (1-2 days)",
                                                   "2" = "Occasionally or a moderate amount of time (3-4 days)",
                                                   "3" = "Most or all of the time (5-7 days)")) %>% as.numeric()))


#reverse scoring positive items
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  mutate(across(c(CESDQ4, CESDQ8, CESDQ12, CESDQ16), ~ 3 - .)) 

#calculate total score
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  rowwise() %>%
  mutate(CESD_Total = sum(c_across(starts_with("CESDQ")), na.rm = TRUE)) %>%
  ungroup() 

#alternate way to calculate total score
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  mutate(CESD_Total = CESDQ1 + CESDQ2 + CESDQ3 + CESDQ4 + CESDQ5 + 
           CESDQ6 + CESDQ7 + CESDQ8 + CESDQ9 + CESDQ10 +
           CESDQ11 + CESDQ12 + CESDQ13 + CESDQ14 + CESDQ15 + 
           CESDQ16 + CESDQ17 + CESDQ18 + CESDQ19 + CESDQ20)

#interpreting score
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  mutate(Depression_Level = case_when(
    CESD_Total < 16 ~ "No Depression",
    CESD_Total >= 16 & CESD_Total < 24 ~ "Mild Depression",
    CESD_Total >= 24 ~ "High Depression",
    TRUE ~ NA_character_))

#alternate way to interpret the score
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  mutate(Depression_Level = fct_relevel(Depression_Level, "No Depression", 
                                        "Mild Depression", "High Depression"))

head(wave1_cohort1_clean[, c("CESD_Total", "Depression_Level")])  #viewing the totaled scores
write_csv(wave1_cohort1_clean, "CESD_Scored.csv", row.names = FALSE)  #saving as a CSV

#| label: cleaning and scoring the RSES
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  mutate(across(starts_with("RosenbergQ"), ~ case_when(
    . == "Strongly Agree" ~ 3,
    . == "Agree" ~ 2,
    . == "Disagree" ~ 1,
    . == "Strongly Disagree" ~ 0,
    TRUE ~ NA_real_)))

#reverse scoring negative items
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  mutate(across(c(RosenbergQ2, RosenbergQ5, RosenbergQ6, RosenbergQ8, RosenbergQ9), ~ 3 - .)) 

#calculate total score
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  rowwise() %>%
  mutate(Rosenberg_Total = sum(c_across(starts_with("RosenbergQ")), na.rm = TRUE)) %>%
  ungroup() 

#interpreting score
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  mutate(Explicit_SE_Level = case_when(
    Rosenberg_Total < 15 ~ "Low Self-Esteem",
    Rosenberg_Total >= 15 & Rosenberg_Total <= 25 ~ "Normal Self-Esteem",
    Rosenberg_Total > 25 ~ "High Self-Esteem",
    TRUE ~ NA_character_)) 

head(wave1_cohort1_clean[, c("Rosenberg_Total", "Explicit_SE_Level")])  #viewing the totaled scores
write_csv(wave1_cohort1_clean, "RSES_Scored.csv", row.names = FALSE)  #saving as a CSV

#| label: data visualization

ggplot(wave1_cohort1_clean, aes(x = CESD_Total)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  theme_minimal() +
  labs(title = "Distribution of CES-D Scores", x = "CES-D Total Score", y = "Frequency")

ggplot(wave1_cohort1_clean, aes(x = RSE_Total)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(title = "Rosenberg Self-Esteem Scale Distribution", x = "RSE Total Score", y = "Count") +
  theme_minimal()

ggplot(wave1_cohort1_clean, aes(x = IAT_Score)) +
  geom_density(fill = "red", alpha = 0.5) +
  labs(title = "Implicit Association Test Score Distribution", x = "IAT Score", y = "Density") +
  theme_minimal()

ggplot(wave1_cohort1_clean, aes(x = Depression_Level, y = Rosenberg_Total)) +
  geom_boxplot() +
  labs(title = "Rosenberg Scores by Depression Level", x = "Depression Level", y = "Rosenberg Total Score")

ggplot(wave1_cohort1_clean, aes(x = CESD_Total, y = Rosenberg_Total, color = Depression_Level)) +
  geom_point() +
  labs(title = "Rosenberg Scores vs. CES-D Scores", x = "CES-D Total Score", y = "Rosenberg Total Score")

ggplot(wave1_cohort1_clean, aes(x = CESD_Total)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  facet_wrap(~ Depression_Level) +
  labs(title = "Distribution of CES-D Scores by Depression Level", x = "CES-D Total Score", y = "Frequency")

#| label: decriptive statistics

summary(wave1_cohort1_clean$CESD_Total)
table(wave1_cohort1_clean$Depression_Level)

  descriptive_stats <- wave1_cohort1_clean %>%
  summarise(
    Mean_CESD = mean(CESD_Total, na.rm = TRUE),
    SD_CESD = sd(CESD_Total, na.rm = TRUE),
    Mean_RSE = mean(RSE_Total, na.rm = TRUE),
    SD_RSE = sd(RSE_Total, na.rm = TRUE),
    Mean_IAT = mean(IAT_Score, na.rm = TRUE),
    SD_IAT = sd(IAT_Score, na.rm = TRUE))

#| label: hypothesis testing

t_test_result <- t.test(CESD_Total ~ Depression_Level, data = wave1_cohort1_clean)
  print(t_test_result)

t_test_result <- t.test(wave1_cohort1_clean$CESD_Total ~ wave1_cohort1_clean$Depression_Level)
print(t_test_result)

cor_test_result <- cor.test(wave1_cohort1_clean$RSE_Total, wave1_cohort1_clean$CESD_Total, use = "complete.obs")
print(cor_test_result)


#| label: presenting statistics

cat("The mean CES-D score was", mean(wave1_cohort1_clean$CESD_Total, na.rm = TRUE), 
      "with a standard deviation of", sd(wave1_cohort1_clean$CESD_Total, na.rm = TRUE), 
      ". A t-test revealed a significant difference in CES-D scores between depression levels (t =", 
      t_test_result$statistic, ", p =", t_test_result$p.value, ").")

cat("The results of the t-test were significant (t(13) = 7.03, p < .001; \\cite{Jiang2022}).")

writeLines(readLines("references.bib"))