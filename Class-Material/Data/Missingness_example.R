# Load packages
library(dplyr)
library(tidyr)

set.seed(42)

# Settings
n_subjects <- 10
n_months <- 6

# Create base data frame
df <- expand.grid(ID = 1:n_subjects, Month = 1:n_months) %>%
  arrange(ID, Month) %>%
  mutate(
    BP = rnorm(n_subjects * n_months, mean = 135, sd = 10),
    Adherence = ifelse(rbinom(n_subjects * n_months, 1, 0.7) == 1, "Yes", "No"),
    Stress = round(pmin(pmax(rnorm(n_subjects * n_months, 5, 2), 0), 10))
  )

# Add BP_lag (previous BP)
df <- df %>%
  group_by(ID) %>%
  arrange(Month) %>%
  mutate(BP_lag = lag(BP)) %>%
  ungroup() %>% 
  arrange(ID,Month)

# ---- Create Different Missingness Mechanisms ----

# 1. MCAR: Random 20% missing
df_mcar <- df %>%
  mutate(
    BP_Missing = ifelse(runif(n()) < 0.2, "Yes", "No"),
    BP = ifelse(BP_Missing == "Yes", NA, BP),
    Mechanism = "(D)"
  )

# 2. MAR (covariate-dependent): Missing when stress >= 7 or not adherent
df_mar_cov <- df %>%
  mutate(
    BP_Missing = ifelse((Stress >= 7 | Adherence == "No") & runif(n()) < 0.6, "Yes", "No"),
    BP = ifelse(BP_Missing == "Yes", NA, BP),
    Mechanism = "(C)"
  )

# 3. MAR (outcome-dependent): Missing if prior BP >= 140
df_mar_out <- df %>%
  mutate(
    BP_Missing = ifelse(!is.na(BP_lag) & BP_lag >= 140 & runif(n()) < 0.6, "Yes", "No"),
    BP = ifelse(BP_Missing == "Yes", NA, BP),
    Mechanism = "(A)"
  )

# 4. MNAR: Missing if current BP >= 140
df_mnar <- df %>%
  mutate(
    BP_Missing = ifelse(BP >= 140 & runif(n()) < 0.6, "Yes", "No"),
    BP = ifelse(BP_Missing == "Yes", NA, BP),
    Mechanism = "(B)"
  )

# ---- Combine all datasets ----
df_all <- bind_rows(df_mcar, df_mar_cov, df_mar_out, df_mnar) %>%
  select(ID, Month, BP, Adherence, Stress, BP_Missing, Mechanism)

# View the first few rows
head(df_all)


write.csv(df_all, "Missingness_example.csv")
