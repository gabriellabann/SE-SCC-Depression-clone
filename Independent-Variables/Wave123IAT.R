#| label: Wave 1
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

write.csv(clean$D, "Wave1_Cohort1_SelfIATOutput.csv")

#reaction time descriptives by block
mean(clean$clean.means.crit1, na.rm=T) #(1028.404)
mean(clean$clean.means.crit2, na.rm=T) #(1396.257)
mean(clean$clean.means.prac1, na.rm=T) #(1114.787)
mean(clean$clean.means.prac2, na.rm=T) #(1487.6)
sd(clean$clean.means.crit1, na.rm=T) #(280.7861)
sd(clean$clean.means.crit2, na.rm=T) #(440.4245)
sd(clean$clean.means.prac1, na.rm=T) #(338.0655)
sd(clean$clean.means.prac2, na.rm=T) #(296.3132)

#| label: Wave 2
available.packages("iatgen")
install.packages("remotes")
remotes::install_github("iatgen/iatgen", force = TRUE)
library(iatgen)

wave2_cohort1_IAT <- read.csv("Wave2_Cohort1_SelfIAT.csv", header=T) 

#collapsing IAT data down
wave2_cohort1_IAT$compatible.crit <- combineIATfourblocks(wave2_cohort1_IAT$Q4.RP4, wave2_cohort1_IAT$Q18.LP4, wave2_cohort1_IAT$Q14.RN7, wave2_cohort1_IAT$Q28.LN7)
wave2_cohort1_IAT$incompatible.crit <- combineIATfourblocks(wave2_cohort1_IAT$Q7.RP7, wave2_cohort1_IAT$Q21.LP7, wave2_cohort1_IAT$Q11.RN4, wave2_cohort1_IAT$Q25.LN4)

#collapsing IAT practice blocks
wave2_cohort1_IAT$compatible.prac<- combineIATfourblocks(wave2_cohort1_IAT$Q3.RP3, wave2_cohort1_IAT$Q17.LP3, wave2_cohort1_IAT$Q13.RN6, wave2_cohort1_IAT$Q27.LN6)
wave2_cohort1_IAT$incompatible.prac <- combineIATfourblocks(wave2_cohort1_IAT$Q6.RP6, wave2_cohort1_IAT$Q20.LP6, wave2_cohort1_IAT$Q10.RN3, wave2_cohort1_IAT$Q24.LN3)

#cleaning the IAT
clean2 <- cleanIAT(prac1=wave2_cohort1_IAT$compatible.prac, 
                  crit1=wave2_cohort1_IAT$compatible.crit, 
                  prac2=wave2_cohort1_IAT$incompatible.prac, 
                  crit2=wave2_cohort1_IAT$incompatible.crit, 
                  
                  timeout.drop=TRUE, 
                  timeout.ms=10000, 
                  
                  fasttrial.drop=FALSE, 
                  
                  fastprt.drop=TRUE, 
                  fastprt.percent=.10, 
                  fastprt.ms=300, 
                  
                  error.penalty=TRUE, 
                  error.penalty.ms=600)

sum(!clean2$skipped) #how many participants completed the IAT (9)
clean2$timeout.rate #timeout drop rate (% of trials) (0.002777778)
clean2$fastprt.count #fast participant drop count and rate (% of sample) (0)
clean2$fastprt.rate #" (0)
clean2$drop.participant #if individual participants were dropped or not (All FALSE)
clean2$error.rate #error rate (0.07520891)
clean2$error.rate.pt #(NULL)
clean2$error.rate.prac1 #error rate of practice combined block (0.04444444)
clean2$error.rate.crit1 #error rate of critical combined block (0.05292479)
clean2$error.rate.prac2 #(0.1340782)
clean2$error.rate.crit2 #(0.08356546)
names(clean2)
IATreliability(clean2)$reliability #internal consistency (0.8732188)
IATalpha(clean2)$alpha.total #reliability of IAT D-score (raw_alpha = 0.7486278)

wave2_cohort1_IAT$D <- clean2$D
mean(clean2$D, na.rm=T) #(0.6795439)
sd(clean2$D, na.rm=T) #(0.4486322)
t.test(clean2$D) #one sample t-test (t = 4.5441, df = 8, p-value = 0.001889, CI(0.3346947, 1.0243931), mean of x = 0.6795439)

mean(clean2$D, na.rm=T) / sd(clean2$D, na.rm=T) #cohen d (1.514702)

# alternate way of calculating cohen's d

s_iat_cohens_d2 <- function(x, y) {
  mean_diff <- mean(x, na.rm = TRUE) - mean(y, na.rm = TRUE)
  pooled_sd <- sqrt((sd(x, na.rm = TRUE)^2 + sd(y, na.rm = TRUE)^2) / 2)
  return(mean_diff / pooled_sd)}

d_value2 <- s_iat_cohens_d(clean2$D, rep(0, length(clean2$D)))

# plotting IAT data

library(ggplot2)
ggplot(wave2_cohort1_IAT, aes(x=D))+
  geom_density(color="black", fill="light blue")+
  theme_light()

write.csv(clean2$D, "Wave2_Cohort1_SelfIATOutput.csv")

#reaction time descriptives by block
mean(clean2$clean.means.crit1, na.rm=T) #(1009.915)
mean(clean2$clean.means.crit2, na.rm=T) #(1212.36)
mean(clean2$clean.means.prac1, na.rm=T) #(978.1003)
mean(clean2$clean.means.prac2, na.rm=T) #(1345.287)
sd(clean2$clean.means.crit1, na.rm=T) #(255.392)
sd(clean2$clean.means.crit2, na.rm=T) #(267.6572)
sd(clean2$clean.means.prac1, na.rm=T) #(153.0976)
sd(clean2$clean.means.prac2, na.rm=T) #(283.4648)

#| label: Wave 3
available.packages("iatgen")
install.packages("remotes")
remotes::install_github("iatgen/iatgen", force = TRUE)
library(iatgen)

wave3_cohort1_IAT <- read.csv("Wave3_Cohort1_SelfIAT.csv", header=T)

#collapsing IAT data down
wave3_cohort1_IAT$compatible.crit <- combineIATfourblocks(wave3_cohort1_IAT$Q4.RP4, wave3_cohort1_IAT$Q18.LP4, wave3_cohort1_IAT$Q14.RN7, wave3_cohort1_IAT$Q28.LN7)
wave3_cohort1_IAT$incompatible.crit <- combineIATfourblocks(wave3_cohort1_IAT$Q7.RP7, wave3_cohort1_IAT$Q21.LP7, wave3_cohort1_IAT$Q11.RN4, wave3_cohort1_IAT$Q25.LN4)

#collapsing IAT practice blocks
wave3_cohort1_IAT$compatible.prac<- combineIATfourblocks(wave3_cohort1_IAT$Q3.RP3, wave3_cohort1_IAT$Q17.LP3, wave3_cohort1_IAT$Q13.RN6, wave3_cohort1_IAT$Q27.LN6)
wave3_cohort1_IAT$incompatible.prac <- combineIATfourblocks(wave3_cohort1_IAT$Q6.RP6, wave3_cohort1_IAT$Q20.LP6, wave3_cohort1_IAT$Q10.RN3, wave3_cohort1_IAT$Q24.LN3)

#cleaning the IAT
clean3 <- cleanIAT(prac1=wave3_cohort1_IAT$compatible.prac, 
                  crit1=wave3_cohort1_IAT$compatible.crit, 
                  prac2=wave3_cohort1_IAT$incompatible.prac, 
                  crit2=wave3_cohort1_IAT$incompatible.crit, 
                  
                  timeout.drop=TRUE, 
                  timeout.ms=10000, 
                  
                  fasttrial.drop=FALSE, 
                  
                  fastprt.drop=TRUE, 
                  fastprt.percent=.10, 
                  fastprt.ms=300, 
                  
                  error.penalty=TRUE, 
                  error.penalty.ms=600)

sum(!clean3$skipped) #how many participants completed the IAT (8)
clean3$timeout.rate #timeout drop rate (% of trials) (0.002083333)
clean3$fastprt.count #fast participant drop count and rate (% of sample) (1)
clean3$fastprt.rate #" (0.125)
clean3$drop.participant #if individual participants were dropped or not (No.8 TRUE)
clean3$error.rate #error rate (0.06563246)
clean3$error.rate.pt #(NULL)
clean3$error.rate.prac1 #error rate of practice combined block (0.03571429)
clean3$error.rate.crit1 #error rate of critical combined block (0.03928571)
clean3$error.rate.prac2 #(0.08571429)
clean3$error.rate.crit2 #(0.0971223)
names(clean3)
IATreliability(clean3)$reliability #internal consistency (0.8357234)
IATalpha(clean3)$alpha.total #reliability of IAT D-score (raw_alpha = 0.8344568)

wave3_cohort1_IAT$D <- clean3$D
mean(clean3$D, na.rm=T) #(0.5509831)
sd(clean3$D, na.rm=T) #(0.3703154)
t.test(clean3$D) #one sample t-test (t = 3.9365, df = 6, p-value = 0.007655, CI(0.2084985, 0.8934676), mean of x = 0.5509831)

mean(clean3$D, na.rm=T) / sd(clean3$D, na.rm=T) #cohen d (1.487875)

# alternate way of calculating cohen's d

s_iat_cohens_d <- function(x, y) {
  mean_diff <- mean(x, na.rm = TRUE) - mean(y, na.rm = TRUE)
  pooled_sd <- sqrt((sd(x, na.rm = TRUE)^2 + sd(y, na.rm = TRUE)^2) / 2)
  return(mean_diff / pooled_sd)}

d_value <- s_iat_cohens_d(clean3$D, rep(0, length(clean3$D)))

# plotting IAT data

library(ggplot2)
ggplot(wave3_cohort1_IAT, aes(x=D))+
  geom_density(color="black", fill="light blue")+
  theme_light()

write.csv(clean3$D, "Wave3_Cohort1_SelfIATOutput.csv")

#reaction time descriptives by block
mean(clean3$clean.means.crit1, na.rm=T) #(987.9962)
mean(clean3$clean.means.crit2, na.rm=T) #(1242.084)
mean(clean3$clean.means.prac1, na.rm=T) #(1094.418)
mean(clean3$clean.means.prac2, na.rm=T) #(1280.369)
sd(clean3$clean.means.crit1, na.rm=T) #(234.0334)
sd(clean3$clean.means.crit2, na.rm=T) #(427.376)
sd(clean3$clean.means.prac1, na.rm=T) #(424.1498)
sd(clean3$clean.means.prac2, na.rm=T) #(482.6326)
