#| label: loading required libraries

# ran quarto::quarto_use_template("wjschne/apaquarto", no_prompt = T) in console

if (!requireNamespace("quarto", quietly = TRUE)) install.packages("tidyverse")
if(!requireNamespace("tidyverse", quietly = TRUE)) install.packages("tidyverse")
if (!requireNamespace("readr", quietly = TRUE)) install.packages("readr")
if (!requireNamespace("forcats", quietly = TRUE)) install.packages("forcats")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
if (!requireNamespace("quarto", quietly = TRUE)) install.packages("quarto")
if (!requireNamespace("knitr", quietly = TRUE)) install.packages("knitr")
if (!requireNamespace("stringr", quietly = TRUE)) install.packages("stringr")
if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")
if (!requireNamespace("tidyr", quietly = TRUE)) install.packages("tidyr")
if(!requireNamespace("scales", quietly = TRUE)) install.packages("scales")
if (!requireNamespace("psych", quietly = TRUE)) install.packages("psych")
if (!requireNamespace("stats", quietly = TRUE)) install.packages("stats")
if (!requireNamespace("lme4", quietly = TRUE)) install.packages("lme4")
if (!requireNamespace("patchwork", quietly = TRUE)) install.packages("patchwork")
if (!requireNamespace("kableExtra", quietly = TRUE)) install.packages("kableExtra")
if (!requireNamespace("rempsyc", quietly = TRUE)) install.packages("rempsyc")
if (!requireNamespace("broom", quietly = TRUE)) install.packages("broom")
if (!requireNamespace("papaja", quietly = TRUE)) install.packages("papaja")
if (!requireNamespace("flextable", quietly = TRUE))install.packages("flextable")

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
set.seed(1:10000, 1)

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

wave1_cohort1_clean <- wave1_cohort1 %>%
  rename_with(~ str_replace_all(., " ", "_")) %>%
  mutate(across(everything(), trimws))

colnames(wave1_cohort1)

colnames(wave1_cohort1_clean)
  
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  rename(RosenbergQ1 = `Rosenberg Q1_1`, RosenbergQ2 = `Rosenberg Q1_2`, 
         RosenbergQ3 = `Rosenberg Q1_3`, RosenbergQ4 = `Rosenberg Q1_4`, 
         RosenbergQ5 = `Rosenberg Q1_5`, RosenbergQ6 = `Rosenberg Q1_6`, 
         RosenbergQ7 = `Rosenberg Q1_7`, RosenbergQ8 = `Rosenberg Q1_8`, 
         RosenbergQ9 = `Rosenberg Q1_9`, RosenbergQ10 = `Rosenberg Q1_10`)

wave1_cohort1_clean <- wave1_cohort1 %>%
  rename(CESDQ1 = `CES-D Q1_1`, CESDQ2 = `CES-D Q1_2`, CESDQ3 = `CES-D Q1_3`, 
         CESDQ4 = `CES-D Q1_4`, CESDQ5 = `CES-D Q1_5`, CESDQ6 = `CES-D Q1_6`, 
         CESDQ7 = `CES-D Q1_7`, CESDQ8 = `CES-D Q1_8`, CESDQ9 = `CES-D Q1_9`, 
         CESDQ10 = `CES-D Q1_10`, CESDQ11 = `CES-D Q1_11`, CESDQ12 = `CES-D Q1_12`, 
         CESDQ13 = `CES-D Q1_13`, CESDQ14 = `CES-D Q1_14`, CESDQ15 = `CES-D Q1_15`, 
         CESDQ16 = `CES-D Q1_16`, CESDQ17 = `CES-D Q1_17`, CESDQ18 = `CES-D Q1_18`, 
         CESDQ19 = `CES-D Q1_19`, CESDQ20 = `CES-D Q1_20`)
#make sure to also clean SCC
#SCC was forgotten for cohort 1, it is included in wave 2, wave 3, and will be included in subsequent cohorts of wave 1

#| label: cleaning and scoring self-IAT

available.packages("iatgen")
install.packages("remotes")
remotes::install_github("iatgen/iatgen", force = TRUE)
library(iatgen)

dat <- read.csv("Wave1_Cohort1_SelfIAT.csv", header=T)

#collapsing IAT data down
dat$compatible.crit <- combineIATfourblocks(dat$Q4.RP4, dat$Q18.LP4, dat$Q14.RN7, dat$Q28.LN7)
dat$incompatible.crit <- combineIATfourblocks(dat$Q7.RP7, dat$Q21.LP7, dat$Q11.RN4, dat$Q25.LN4)

#collapsing IAT practice blocks
dat$compatible.prac<- combineIATfourblocks(dat$Q3.RP3, dat$Q17.LP3, dat$Q13.RN6, dat$Q27.LN6)
dat$incompatible.prac <- combineIATfourblocks(dat$Q6.RP6, dat$Q20.LP6, dat$Q10.RN3, dat$Q24.LN3)

#cleaning the IAT
clean <- cleanIAT(prac1=dat$compatible.prac, 
                  crit1=dat$compatible.crit, 
                  prac2=dat$incompatible.prac, 
                  crit2=dat$incompatible.crit, 
                  
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

dat$D <- clean$D
mean(clean$D, na.rm=T) #(0.7055081)
sd(clean$D, na.rm=T) #(0/3755495)
t.test(clean$D) #one sample t-test (t = 7.0291, df = 13, p-value = 8.945e-06, CI(0.4886723, 0.9223440), mean of x = 0.7055081)

mean(clean$D, na.rm=T) / sd(clean$D, na.rm=T) #cohen d (1.878)

library(ggplot2)
ggplot(dat, aes(x=D))+
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
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  mutate(across(starts_with("CESDQ"), ~ fct_recode(as.factor(.),
                                                   "0" = "Rarely or none of the time (less than 1 day)",
                                                   "1" = "Some or a little of the time (1-2 days)",
                                                   "2" = "Occasionally or a moderate amount of time (3-4 days)",
                                                   "3" = "Most or all of the time (5-7 days)")) %>% as.numeric())


#reverse scoring positive items
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  mutate(across(c(CESDQ4, CESDQ8, CESDQ12, CESDQ16), ~ 3 - .)) 

#calculate total score
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  rowwise() %>%
  mutate(CESD_Total = sum(c_across(starts_with("CESDQ")), na.rm = TRUE)) %>%
  ungroup() 

#interpreting score
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  mutate(Depression_Level = case_when(
    CESD_Total < 16 ~ "No Depression",
    CESD_Total >= 16 & CESD_Total < 24 ~ "Mild Depression",
    CESD_Total >= 24 ~ "High Depression",
    TRUE ~ NA_character_)) 

head(wave1_cohort1_clean[, c("CESD_Total", "Depression_Level")])  #viewing the totaled scores
write.csv(wave1_cohort1_clean, "CESD_Scored.csv", row.names = FALSE)  #saving as a CSV

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
write.csv(wave1_cohort1_clean, "RSES_Scored.csv", row.names = FALSE)  #saving as a CSV

#| label: data visualization

ggplot(wave1_cohort1_clean, aes(x = CESD_Total, fill = Depression_Level)) +
  geom_histogram(binwidth = 2, color = "black") +
  facet_wrap(~Depression_Level) +
  labs(title = "CES-D Score Distribution", x = "CES-D Total Score", y = "Count", fill = "Depression Level") +
  theme_minimal()

ggplot(wave1_cohort1_clean, aes(x = RSE_Total)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(title = "Rosenberg Self-Esteem Scale Distribution", x = "RSE Total Score", y = "Count") +
  theme_minimal()

ggplot(wave1_cohort1_clean, aes(x = IAT_Score)) +
  geom_density(fill = "red", alpha = 0.5) +
  labs(title = "Implicit Association Test Score Distribution", x = "IAT Score", y = "Density") +
  theme_minimal()

#| label: decriptive statistics

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
t_test_result

cor_test_result <- cor.test(wave1_cohort1_clean$RSE_Total, wave1_cohort1_clean$CESD_Total, use = "complete.obs")
cor_test_result
