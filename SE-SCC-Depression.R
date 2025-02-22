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
  
wave1_cohort1_clean <- wave1_cohort1_clean %>%
  select(RosenbergQ1 = `Rosenberg Q1_1`, RosenbergQ2 = `Rosenberg Q1_2`, RosenbergQ3 = `Rosenberg Q1_3`, RosenbergQ4 = `Rosenberg Q1_4`, RosenbergQ5 = `Rosenberg Q1_5`, RosenbergQ6 = `Rosenberg Q1_6`, RosenbergQ7 = `Rosenberg Q1_7`, RosenbergQ8 = `Rosenberg Q1_8`, RosenbergQ9 = `Rosenberg Q1_9`, RosenbergQ10 = `Rosenberg Q1_10`)
# make sure to also clean self-IAT, SCC, and CES-D