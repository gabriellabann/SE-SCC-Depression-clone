# ran install.packages("quarto") in console
# ran library(quarto) in console

# verified getwd() in console

# ran quarto::quarto_use_template("wjschne/apaquarto", no_prompt = T) in console

# ran install.packages("tidyverse") in console
# ran library(tidyverse) in console

# ran install.packages("scales") in console
# ran library(scales) in console

# ran install.packages("psych") in console
# ran library(psych) in console

# ran install.packages("stats") in console
# ran library(stats) in console

# ran install.packages("lme4") in console
# ran library(lme4) in console

# ran install.packages("patchwork") in console
# ran library(patchwork) in console

# ran install.packages("kableExtra") in console
# ran library(kableExtra) in console

# ran install.packages("rempsyc") in console
# ran library(rempsyc) in console

# ran install.packages("broom") in console
# ran library(broom) in console

# ran install.packages("papaja") in console
# ran library(papaja) in console

# ran install.packages("flextable") in console
# ran library(flextable) in console

#| label: setup

library(tidyverse)
set.seed(1:10000, 1)

#| label: reading in data

library(readr)
setwd("C:/Users/gabri/repos/SE-SCC-Depression/LocalOnly")
wave1_cohort1 <- readr::read_csv("Wave1_Cohort1.csv",
                          trim_ws = FALSE, 
                          name_repair = "minimal", 
                          col_types = cols(.default = col_character()))
#| label: inspecting the data

head(wave1_cohort1)
str(wave1_cohort1)
glimpse(wave1_cohort1)

#| label: cleaning the data

wave1_cohort1_clean <- wave1_cohort1

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
# make sure to also clean self-IAT, SCC, and CES-D
# SCC was forgotton for cohort 1, it is included in wave 2, wave 3, and will be included in subsequent cohorts of wave 1

#scoring Self-IAT
install.packages(iatgen)
library(iatgen)

dat <- read.csv("Wave1_Cohort1_SelfIAT.csv", header=T)

#Collapsing IAT data down
dat$compatible.crit <- combineIATfourblocks(dat$Q4.RP4, dat$Q18.LP4, dat$Q14.RN7, dat$Q28.LN7)
dat$incompatible.crit <- combineIATfourblocks(dat$Q7.RP7, dat$Q21.LP7, dat$Q11.RN4, dat$Q25.LN4)

#Collapsing IAT practice blocks
dat$compatible.prac<- combineIATfourblocks(dat$Q3.RP3, dat$Q17.LP3, dat$Q13.RN6, dat$Q27.LN6)
dat$incompatible.prac <- combineIATfourblocks(dat$Q6.RP6, dat$Q20.LP6, dat$Q10.RN3, dat$Q24.LN3)

#Cleaning the IAT
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