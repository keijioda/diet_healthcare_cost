
# Required pacakges
pacs <- c(
  "tidyverse", 
  "readxl", 
  "rurality", 
  "tableone",
  "ineq",
  "glmmTMB", 
  "splines", 
  "broom.mixed", 
  "marginaleffects",
  "scales",
  "gt",
  "rlang"
)
sapply(pacs, require, character.only = TRUE)
source("functions.R")

# Medicare crosswalk ------------------------------------------------------

# Crosswalk file: n = 70,968
crosswalk <- read_fwf(
  "./Data/12172/2022/ssn_bene_xwalk_res000058038_req012172_2022.dat",
  fwf_widths(
    c(9, 15, 1, 1, 1),
    c("ORIG_SSN", "BENE_ID", "SSN_MATCH", "SEX_MATCH", "DOB_MATCH")
  )
)

# SSN matched: n = 52,704
all_matched_bene_ids <- crosswalk %>%
  filter(SSN_MATCH == 1)

# Gender or DOB mismatch: n = 3,368
mismatches <- crosswalk %>%
  filter(SSN_MATCH == 1 & (SEX_MATCH == 0 | DOB_MATCH == 0)) %>%
  select(BENE_ID)

# 2 duplicate beneficiary IDs
dup_BENE_IDs <- all_matched_bene_ids %>%
  group_by(BENE_ID) %>%
  summarize(n = sum(n())) %>%
  filter(n > 1)

# Duplicate SSN: n = 106
dup_SSNs <- all_matched_bene_ids %>%
  group_by(ORIG_SSN) %>%
  summarize(n = sum(n())) %>%
  filter(n > 1)

# These will be excluded
exclude_BENE_IDs <- dup_BENE_IDs %>%
  select(BENE_ID) %>%
  union(all_matched_bene_ids %>%
          filter(ORIG_SSN %in% dup_SSNs$ORIG_SSN) %>%
          select(BENE_ID)
  ) %>%
  union(mismatches) 


# Read MBSF data ----------------------------------------------------------

# Read data format for MBSF
fts_mbsf <- read_excel("./data/mbsf_format.xlsx")

# Read data from 2008 to 2020
year <- 2008:2020
fname <- paste0("./Data/12172/", year, "/mbsf_abcd_summary_res000058038_req012172_", year, ".dat")

# Read MBSF files 2008-2020, excluding above beneficiary IDs
all_mbsf <- fname %>%
  lapply(\(x) read_fwf(x, fwf_widths(fts_mbsf$length, fts_mbsf$long_name))) %>%
  lapply(\(x) anti_join(x, exclude_BENE_IDs)) %>%
  setNames(year)

# Read data from 2021 to 2022
year <- 2021:2022
fname <- paste0("./Data/14345/", year, "/mbsf_abcd_summary_res000058038_req014345_", year, ".dat")

add_mbsf <- fname %>%
  lapply(\(x) read_fwf(x, fwf_widths(fts_mbsf$length, fts_mbsf$long_name))) %>%
  lapply(\(x) anti_join(x, exclude_BENE_IDs)) %>%
  setNames(year)

# Long-format over 15 years: n = 463,648
all_mbsf_long <- c(all_mbsf, add_mbsf) %>%
  do.call(rbind, .) %>%
  arrange(BENE_ID, BENE_ENROLLMT_REF_YR)

# 46,897 distinct beneficiary IDs
n_distinct(all_mbsf_long$BENE_ID)


# Read chronic condition data ---------------------------------------------

# Read data format for CC 2008-2020
fts_cc <- read_excel("./Data/mbsf_cc_format.xlsx")

year <- 2008:2020
fname <- paste0("./Data/12172/", year, "/mbsf_cc_summary_res000058038_req012172_", year, ".dat")

all_cc <- fname %>%
  lapply(\(x) read_fwf(x, fwf_widths(fts_cc$length, fts_cc$long_name))) %>%
  lapply(\(x) anti_join(x, exclude_BENE_IDs)) %>%
  setNames(year)

# Read data format for CC 2021-2022
fts_chronic <- read_excel("./Data/mbsf_chronic_format.xlsx")

year <- 2021:2022
fname <- paste0("./Data/14345/", year, "/mbsf_chronic_summary_res000058038_req014345_", year, ".dat")

add_cc <- fname %>%
  lapply(\(x) read_fwf(x, fwf_widths(fts_chronic$length, fts_chronic$long_name))) %>%
  lapply(\(x) anti_join(x, exclude_BENE_IDs)) %>%
  lapply(\(x) rename(x, HYPERL_EVER = HLP_EVER, CHF_EVER = HF_EVER, HYPERT_EVER = HTN_EVER, HYPOTH_EVER = HYPTHYRD_EVER)) %>%
  setNames(year)

# Long-format over 15 years: n = 463,648
all_cc_long <- c(all_cc, add_cc) %>%
  do.call(bind_rows, .) %>%
  arrange(BENE_ID, BENE_ENROLLMT_REF_YR)

# 46,897 distinct beneficiary IDs
n_distinct(all_cc_long$BENE_ID)


# Read MBSF cost use data -------------------------------------------------

# Read all cost use data
# Long-format over 15 years: n = 463,648
source("read_mbsf_costuse.R")
all_cu_long <- read_mbsf_costuse_years(2008:2022) %>% 
  anti_join(exclude_BENE_IDs, by = "BENE_ID") 

# 46,897 distinct beneficiary IDs
n_distinct(all_cu_long$BENE_ID)


# Merge Medicare data -----------------------------------------------------

# Check if all have same number of rows
nrow(all_mbsf_long) == nrow(all_cc_long)
nrow(all_mbsf_long) == nrow(all_cu_long)

all_mdcr_long <- all_mbsf_long %>% 
  inner_join(all_cc_long, by = c("BENE_ID", "BENE_ENROLLMT_REF_YR")) %>% 
  inner_join(all_cu_long, by = c("BENE_ID", "BENE_ENROLLMT_REF_YR")) 

# Check: n = 463,648 from 46,897 distinct BENE_IDs
nrow(all_mdcr_long)
n_distinct(all_mdcr_long$BENE_ID)


# AHS-2 Medicare link file ------------------------------------------------

# Read link file
# n = 51,917
ahs <- read_csv("./data/MedicareMatches2022.csv")

# Distinct analysis ID: n = 51,589
n_distinct(ahs$AnalysisID)

# Duplicate analysis ID: n = 104
exclude_analysisIDs <- ahs %>%
  count(AnalysisID) %>%
  filter(n > 1) %>%
  select(AnalysisID)

# 432 duplicates from 104 analysis IDs
ahs %>% 
  filter(AnalysisID %in% exclude_analysisIDs$AnalysisID)

# Remove them: n = 51,485
ahs_dup_removed <- ahs %>% 
  anti_join(exclude_analysisIDs) %>% 
  mutate(AnalysisID = parse_number(AnalysisID)) %>% 
  setNames(tolower(names(ahs)))


# Read AHS-2 baseline data ------------------------------------------------

# Read AHS-2 BQ, not imputed
# n = 96,114
ahsdata <- read.csv("./data/BaselineDataForMedicare20190531.csv", header = TRUE) %>% 
  as_tibble()
names(ahsdata) <- tolower(names(ahsdata))


# Merge AHS-2 and Medicare data -------------------------------------------

# Merge AHS link file and BQ data
ahs_link_bq <- ahsdata %>%
  inner_join(ahs_dup_removed, by = "analysisid") 

# Check: n = 51,485
n_distinct(ahs_link_bq$analysisid)

# Merge AHS and Medicare data: n = 461,615
mdcr_ahs <- all_mdcr_long %>% 
  janitor::clean_names() %>% 
  inner_join(ahs_link_bq, by = "bene_id")

# From 46,687 distinct Analysis IDs
n_distinct(mdcr_ahs$analysisid)

# Opt-outs: n = 395
optout <- read_csv("./data/OptOutAnalysisIDs.csv") %>% setNames("analysisid")

# n = 162 to be excluded
mdcr_ahs %>% 
  distinct(analysisid) %>% 
  semi_join(optout) %>% 
  nrow()

# Those who live outside US: n = 163
outside_us <- read_csv("./data/outside_us.csv")

# n = 50 to be excluded
mdcr_ahs %>% 
  distinct(analysisid) %>% 
  semi_join(outside_us, by = "analysisid") %>% 
  nrow()

# Remove opt-outs and those who live outside
# yielding nobs = 459,660 from 46,475 distinct analysisid
mdcr_ahs <- mdcr_ahs %>% 
  anti_join(optout, by = "analysisid") %>% 
  anti_join(outside_us, by = "analysisid")

nrow(mdcr_ahs)
n_distinct(mdcr_ahs$analysisid)

# Define model variables --------------------------------------------------

# Dietary patterns, vegstat 1-5 are:
vegstat_labels <- c("vegan", "lacto-ovo", "semi", "pesco", "nonveg")

census_regions <- read_csv("./data/census_regions.csv", col_types = "cccc")

# For urban/rural variable...
# Helper function to get the most frequent FIPS code over 12 months
get_mode <- function(x) {
  x <- x[!is.na(x) & x != "99999"]
  if (length(x) == 0) return(NA_character_)
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# Variable names for state/country FIPS code, Jan to Dec
fips_cols <- paste0("state_cnty_fips_cd_", sprintf("%02d", 1:12))

# Get the mode of the FIPS code over 12 months
# Will be used to identify urban/rural in the code below
fips_mat            <- as.matrix(mdcr_ahs[fips_cols])
mdcr_ahs$fips_modal <- apply(fips_mat, 1, get_mode)

# n.obs = 459,660 from 46,475 distinct Analysis IDs
mdcr_ahs2 <- mdcr_ahs %>% 
  mutate(
    sex        = factor(sex_ident_cd, labels = c("Male", "Female")),
    sex        = relevel(sex, ref = "Female"),
    age        = age_at_end_ref_yr,
    cage       = age - 65,
    birth_yr   = year(ymd(bene_birth_dt)),
    bth_cohort = cut(birth_yr,
                     breaks = c(-Inf, 1919, 1929, 1939, 1949, Inf),
                     labels = c("<1920", "1920s", "1930s", "1940s", "≥1950")),
    rti_race3  = recode(rti_race_cd + 1, 3, 1, 2, 3, 3, 3, 3),
    rti_race3  = factor(rti_race3, labels = c("NHWhite", "Black", "Other")),
    educyou    = parse_number(educyou, na = c("", "*")),
    educat3    = cut(educyou, breaks = c(0, 3, 6, 9)),
    educat3    = factor(educat3, labels = c("HS or less", "Some college", "Col grad")),
    educat3m   = relevel(educat3, ref = "Col grad"),
    marital    = parse_number(marital, na = c("", "*")),
    marital    = recode(marital, "Never", "Married", "Married", "Married", "Div/Wid", "Div/Wid", "Div/Wid"),
    marital    = factor(marital, levels = c("Married", "Never", "Div/Wid")),
    smoke      = parse_number(smoke, na = c("", " ", "*")),
    smkcat     = case_when(
      smokenow == 1 ~ 3,
      smoke > 1 & is.na(smokenow) ~ 2,
      smoke == 1 ~ 1
    ),
    smkcat     = factor(smkcat, labels = c("Never", "Past", "Current")),
    # smkever    = factor(smkcat, labels = c("Never", "Ever", "Ever")),
    alccat     = case_when(
      alcnow == 1 ~ 3,
      alcohol == 2 & (is.na(alcnow) | alcnow == 0) ~ 2,
      alcohol == 1 ~ 1
    ),
    alccat     = factor(alccat, labels = c("Never", "Past", "Current")),
    # alcever    = factor(alcohol, labels = c("Never", "Ever")),
    vegstat    = factor(vegstat, labels = vegstat_labels),
    vegstat    = fct_relevel(vegstat, "pesco", after = 2),      # Change level order, pesco, semi, nonveg
    vegstat2   = relevel(vegstat, ref = "nonveg"),
    cyear      = extract_year - 2008,
    
    # Number of months of both parts A and B coverage
    ab_entitled_months = pmin(bene_hi_cvrage_tot_mons, bene_smi_cvrage_tot_mons),
    
    # Original reason for entitlement
    entlmt_rsn = factor(entlmt_rsn_orig, labels = c("Age", "DIB/ESRD", "DIB/ESRD", "DIB/ESRD")),
    
    # "Died this year" indicator variable
    bene_death_dt  = lubridate::ymd(bene_death_dt),
    died_this_year = !is.na(bene_death_dt) & lubridate::year(bene_death_dt) == extract_year,
    died_this_year = factor(died_this_year, levels = c(FALSE, TRUE), labels = c("No", "Yes")),
    
    # State FIPS
    state_fips = substr(fips_modal, 1, 2),
    
    # Rural-urban code and define urban/rural
    rucc = get_rucc(fips_modal),
    urban_rural = case_when(
      rucc %in% 1:3 ~ "Urban",
      rucc %in% 4:9 ~ "Rural",
      TRUE           ~ NA_character_
    ),
    urban_rural = factor(urban_rural, levels = c("Urban", "Rural"))
  ) %>%
  left_join(census_regions, by = "state_fips") %>%    # Get census regions "region"
  mutate(
    region = factor(region),
    region = relevel(region, ref = "West")
  )
  
# Check
nrow(mdcr_ahs2)
n_distinct(mdcr_ahs2$analysisid)


# Calculate total payment subject-year, nominal & real --------------------

# Setup
# Identify part A payment variables
payment_vars_part_a <- mdcr_ahs2 %>%
  select(matches("(acute|oip|snf|hos|hh)_(mdcr|bene|prmry|perdiem)_pmt$")) %>%
  names()

# Identify part B payment variables
payment_vars_part_b <- mdcr_ahs2 %>%
  select(matches("(hop|asc|anes|ptb_drug|em|phys|dialys|oproc|img|test|dme|othc)_(mdcr|bene|prmry)_pmt$")) %>%
  names()

# CPI-U Medical Care data, monthly, seasonally-adjusted
# https://fred.stlouisfed.org/series/CPIMEDSL
cpi_medical_month <- read_csv("./data/CPIMEDSL.csv")
cpi_medical_year <- cpi_medical_month %>%
  mutate(extract_year = year(observation_date)) %>%
  group_by(extract_year) %>%
  summarize(cpi_medical = mean(CPIMEDSL, na.rm = TRUE))

# Calculate deflator to converts every year's dollars into 2022 dollars
ref_year <- 2022
ref_cpi  <- cpi_medical_year$cpi_medical[cpi_medical_year$extract_year == ref_year]

cpi_medical_year <- cpi_medical_year %>%
  mutate(deflator_2022usd = ref_cpi / cpi_medical)

# Calculate total payment subject-year, both nominal and real 
# Note that total_pmt = Part A + Part B only and keep Part D as separate
mdcr_ahs3 <- mdcr_ahs2 %>%
  left_join(cpi_medical_year, by = "extract_year") %>%
  mutate(
    pmt_pt_a            = rowSums(across(all_of(payment_vars_part_a)), na.rm = TRUE),
    pmt_pt_a_2022usd    = pmt_pt_a * deflator_2022usd,
    pmt_pt_a_2022usd_k  = pmt_pt_a_2022usd / 1000,
    
    pmt_pt_b            = rowSums(across(all_of(payment_vars_part_b)), na.rm = TRUE),
    pmt_pt_b_2022usd    = pmt_pt_b * deflator_2022usd,
    pmt_pt_b_2022usd_k  = pmt_pt_b_2022usd / 1000,
    
    pmt_pt_d            = ptd_total_rx_cst,
    pmt_pt_d_2022usd    = pmt_pt_d * deflator_2022usd,
    pmt_pt_d_2022usd_k  = pmt_pt_d_2022usd / 1000,
    
    total_pmt           = pmt_pt_a + pmt_pt_b,
    total_pmt_2022usd   = total_pmt * deflator_2022usd,
    total_pmt_2022usd_k = total_pmt_2022usd / 1000
  )

# Check
mdcr_ahs3 %>%
  select(bene_id, bene_enrollmt_ref_yr, total_pmt, pmt_pt_a, pmt_pt_b, pmt_pt_d)


# Inclusion-exclusion criteria --------------------------------------------

# Exclude those years before reaching age 65
# n.obs = 436,425 from 45,076 distinct Analysis IDs
mdcr_ahs_65 <- mdcr_ahs3 %>% 
  filter(age_at_end_ref_yr >= 65)

nrow(mdcr_ahs_65)
n_distinct(mdcr_ahs_65$analysisid)

# Exclude those years of any months of Medicare Advantage enrollment
# n.obs = 281,197 from 35,864 distinct Analysis IDs
mdcr_ahs_65_ffs <- mdcr_ahs_65 %>% 
  filter(bene_hmo_cvrage_tot_mons == 0)

nrow(mdcr_ahs_65_ffs)
n_distinct(mdcr_ahs_65_ffs$analysisid)

# Exclude those years of residing in US territories: n = 107
# n.obs = 281,146 from 35,859 distinct Analysis IDs
territory_fips <- c("72", "66", "78", "69", "60")  # PR, Guam, USVI, N. Mariana, American Samoa

mdcr_ahs_65_ffs <- mdcr_ahs_65_ffs %>%
filter(!(state_fips %in% territory_fips))

nrow(mdcr_ahs_65_ffs)
n_distinct(mdcr_ahs_65_ffs$analysisid)

# Death during the observation year
# There are 14 deaths not validated
mdcr_ahs_65_ffs %>% count(died_this_year)
mdcr_ahs_65_ffs %>% count(valid_death_dt_sw)

# All of them died at the end of the month
# When the exact day of death isn't available from the underlying source, 
# CMS fills in the day as the last day of that month as a placeholder
mdcr_ahs_65_ffs %>%
  filter(died_this_year == "Yes", is.na(valid_death_dt_sw)) %>%
  select(bene_id, extract_year, bene_death_dt, valid_death_dt_sw)

# Complete dataset

# Variables needed 
var_needed <- c(
  "analysisid",
  "bene_id",
  "vegstat",
  "vegstat2",
  "extract_year",
  "cyear",
  "age",
  "cage",
  "birth_yr",
  "bth_cohort",
  "bene_birth_dt",
  "sex",
  "rti_race3",
  "region",
  "urban_rural",
  "educat3",
  "educat3m",
  "marital",
  "smkcat",
  "alccat",
  "dual_elgbl_mons",
  "ptd_plan_cvrg_mons",
  "entlmt_rsn",
  "died_this_year",
  "ab_entitled_months",
  "bene_hi_cvrage_tot_mons",
  "bene_smi_cvrage_tot_mons",
  "total_pmt",
  "total_pmt_2022usd",
  "total_pmt_2022usd_k",
  "pmt_pt_a",
  "pmt_pt_a_2022usd",
  "pmt_pt_a_2022usd_k",
  "pmt_pt_b",
  "pmt_pt_b_2022usd",
  "pmt_pt_b_2022usd_k"
  # "pmt_pt_d",
  # "pmt_pt_d_2022usd",
  # "pmt_pt_d_2022usd_k"
)

# n.obs = 268,301 from 34,254 distinct Analysis IDs
mdcr_ahs_65_ffs <- mdcr_ahs_65_ffs %>% 
  select(all_of(var_needed)) %>% 
  drop_na()

nrow(mdcr_ahs_65_ffs)
n_distinct(mdcr_ahs_65_ffs$analysisid)


# Descriptive table -------------------------------------------------------

# n.obs = 268,301 from 34,254 distinct Analysis IDs
nrow(mdcr_ahs_65_ffs)
n_distinct(mdcr_ahs_65_ffs$analysisid)

# Baseline characteristics
baseline_data <- mdcr_ahs_65_ffs %>%
  group_by(bene_id) %>%
  slice_min(extract_year, n = 1, with_ties = FALSE) %>%
  ungroup() %>% 
  rename(ffs_entry_age = age) %>% 
  mutate(
    ab_entitled_cat = case_when(
      ab_entitled_months == 0  ~ "0 months",
      ab_entitled_months < 12  ~ "1-11 months",
      ab_entitled_months == 12 ~ "12 months"),
    ptd_cvrg_cat = case_when(
      ptd_plan_cvrg_mons == 0  ~ "0 months",
      ptd_plan_cvrg_mons < 12  ~ "1-11 months",
      ptd_plan_cvrg_mons == 12 ~ "12 months"),
    dual_elgbl_cat = case_when(
      dual_elgbl_mons  == 0  ~ "0 months",
      dual_elgbl_mons  < 12  ~ "1-11 months",
      dual_elgbl_mons  == 12 ~ "12 months"),
 )

# Variables needed for descriptive table 
table_vars <- c(
  "sex",
  "bth_cohort",
  "ffs_entry_age",
  "rti_race3",
  "region",
  "urban_rural",
  "educat3",
  "marital",
  "smkcat",
  "alccat",
  "entlmt_rsn",
  "ab_entitled_cat",
  "ptd_cvrg_cat",
  "dual_elgbl_cat"
)

baseline_data %>% 
  CreateTableOne(table_vars, strata = "vegstat", data = ., addOverall = TRUE) %>%
  print(showAllLevels = TRUE, test = FALSE) 

# Person-year by vegstat
mdcr_ahs_65_ffs %>%
  count(extract_year, vegstat) %>%
  group_by(extract_year) %>%
  mutate(pct = sprintf("%d (%.1f%%)", n, 100 * n / sum(n))) %>%
  ungroup() %>%
  select(extract_year, vegstat, pct) %>%
  pivot_wider(names_from = vegstat, values_from = pct) %>%
  left_join(
    mdcr_ahs_65_ffs %>%
      filter(!is.na(vegstat)) %>%
      count(extract_year, name = "Total"),
    by = "extract_year"
  ) %>%
  relocate(Total, .after = extract_year) %>%
  setNames(c("Year", "Total", "Vegan", "Lacto-ovo", "Pesco-veg", "Semi-veg", "Non-veg")) %>%
  knitr::kable()

# Line plot of numbers of beneficiary-years by dietary group  
mdcr_ahs_65_ffs %>%
  count(extract_year, vegstat) %>% 
  ggplot(aes(x = extract_year, y = n, color = vegstat)) +
  geom_point() +
  geom_line() +
  scale_color_discrete(
    name = "Dietary group",
    labels = c(
      "vegan"     = "Vegan",
      "lacto-ovo" = "Lacto-ovo vegetarian",
      "pesco"     = "Pesco-vegetarian",
      "semi"      = "Semi-vegetarian",
      "nonveg"    = "Non-vegetarian"
    )
  ) +
  labs(y = "Number of beneficiary-years", x = "Year") +
  theme_bw() +
  theme(legend.position = "bottom")

# Mortality table
mortality_data <- mdcr_ahs_65_ffs %>%
  group_by(bene_id, vegstat) %>%
  summarise(
    died         = any(died_this_year == "Yes", na.rm = TRUE),
    death_year   = if (any(died_this_year == "Yes", na.rm = TRUE))
      min(extract_year[died_this_year == "Yes"]) else NA_real_,
    n_years_obs  = n(),
    entry_year   = min(extract_year),
    exit_year    = max(extract_year),
    .groups = "drop"
  )

# N, person-years, follow-up years by vegstat
# Percent died and crude mortality rate
# Crude mortality rates shown for descriptive purposes
# Diet groups differ in baseline age distribution (Table 1).
mortality_data %>%
  group_by(vegstat) %>%
  summarise(
    n            = n(),
    n_died       = sum(died),
    pct_died     = sprintf("%2.1f", 100 * mean(died)),
    person_years = sum(n_years_obs),
    rate_per_1000_py = sprintf("%2.1f", 1000 * n_died / person_years)
  ) %>% 
  knitr::kable(align = c("l", "r", "r", "r", "r", "r"))

# Cost-distribution/skewness table by vegstat
# Uses the full beneficiary-year panel (mdcr_ahs_65_ffs)
make_cost_summary_table(
  mdcr_ahs_65_ffs, 
  payment_var = "total_pmt_2022usd", 
  include_zero = TRUE
)

make_cost_summary_table(
  mdcr_ahs_65_ffs, 
  payment_var = "total_pmt_2022usd", 
  include_zero = FALSE
)

# non-zero-payment rate by year × vegstat
nonzero_by_year <- mdcr_ahs_65_ffs %>%
  group_by(vegstat, extract_year) %>%
  summarise(
    n            = n(),
    n_nonzero    = sum(total_pmt_2022usd > 0, na.rm = TRUE),
    pct_nonzero  = 100 * mean(total_pmt_2022usd > 0, na.rm = TRUE),
    .groups = "drop"
  )

# Wide table 
nonzero_wide <- nonzero_by_year %>%
  select(vegstat, extract_year, pct_nonzero) %>%
  pivot_wider(names_from = vegstat, values_from = pct_nonzero)

nonzero_wide

# Line plot of non-zero payment % by vegstat 
ggplot(nonzero_by_year, aes(x = extract_year, y = pct_nonzero, color = vegstat)) +
  geom_line() +
  geom_point(size = 1.5) +
  scale_y_continuous(limits = c(70, 100), labels = scales::label_percent(scale = 1)) +
  scale_color_discrete(labels = c("Vegan", "Lacto-ovo vegetarian", "Pesco-vegetarian",
                                  "Semi-vegetarian", "Non-vegetarian")) +
  labs(
    x = "Calendar year",
    y = "% of beneficiary-years with any positive payment",
    color = "Diet group",
    title = "Crude utilization rate by calendar year and diet group"
  ) +
  theme_minimal()


# Crude utilization rate by dietary group ---------------------------------

# Percent of zero total payment = 16.4%
mdcr_ahs_65_ffs %>%
  mutate(
    zero_pmt = ifelse(total_pmt_2022usd == 0, 0, 1),
    zero_pmt = factor(zero_pmt, labels = c("Zero", "Non-zero"))
  ) %>%
  group_by(zero_pmt) %>%
  summarize(n = n()) %>%
  mutate(pct = n / sum(n) * 100)

# Over years
mdcr_ahs_65_ffs %>%
  mutate(
    zero_pmt = ifelse(total_pmt_2022usd == 0, 0, 1)
  ) %>%
  group_by(extract_year, vegstat) %>%
  summarize(
    pct_use = mean(zero_pmt, na.rm = TRUE)
  ) %>% 
  ggplot(aes(x = extract_year, y = pct_use, color = vegstat)) +
  geom_point() +
  geom_line() + 
  scale_y_continuous(
    labels = scales::percent,
    limits = c(.75, .91)
  ) +
  scale_color_discrete(
    name = "Dietary group",
    labels = c(
      "vegan"     = "Vegan",
      "lacto-ovo" = "Lacto-ovo vegetarian",
      "pesco"     = "Pesco-vegetarian",
      "semi"      = "Semi-vegetarian",
      "nonveg"    = "Non-vegetarian"
    )
  ) +
  labs(
    x = "Year",
    y = "Healthcare utilization (% with any payment)"
  ) +
  theme_bw() +
  theme(legend.position = "bottom")

# Medicare advantage enrollment by dietary pattern
mdcr_ahs %>% 
  filter(!is.na(vegstat)) %>% 
  filter(!(state_code %in% territory_fips)) %>% 
  mutate(
    ma = ifelse(bene_hmo_cvrage_tot_mons > 0, 1, 0),
    vegstat    = factor(vegstat, labels = vegstat_labels),
    vegstat    = fct_relevel(vegstat, "pesco", after = 2)
  ) %>% 
  group_by(extract_year, vegstat) %>% 
  summarize(pct_ma = mean(ma)) %>% 
  ggplot(aes(x = extract_year, y = pct_ma, color = vegstat)) +
  geom_point() +
  geom_line() +
  scale_y_continuous(
    labels = scales::percent,
    limits = c(0, 0.6)
  ) +
  scale_color_discrete(
    name = "Dietary group",
    labels = c(
      "vegan"     = "Vegan",
      "lacto-ovo" = "Lacto-ovo vegetarian",
      "pesco"     = "Pesco-vegetarian",
      "semi"      = "Semi-vegetarian",
      "nonveg"    = "Non-vegetarian"
    )
  ) +
  labs(
    x = "Year",
    y = "Proportion of beneficiaries with Medicare Advantage"
  ) +
  theme_bw() +
  theme(legend.position = "bottom")

mdcr_ahs_ma2 <- mdcr_ahs %>% 
  filter(!is.na(vegstat)) %>% 
  filter(!(state_code %in% territory_fips)) %>% 
  mutate(
    ab_entitled_months = pmin(bene_hi_cvrage_tot_mons, bene_smi_cvrage_tot_mons),
    status = case_when(
      bene_hmo_cvrage_tot_mons == 12 ~ "MA (full year)",
      bene_hmo_cvrage_tot_mons > 0 & bene_hmo_cvrage_tot_mons < 12 ~ "Mixed FFS/MA",
      bene_hmo_cvrage_tot_mons == 0 & ab_entitled_months > 0 ~ "FFS",
      TRUE ~ "Exited/not enrolled"  # death, disenrollment, etc.
    )
  ) %>%
  select(bene_id, extract_year, vegstat, status)

library(ggalluvial)
alluvial_data <- mdcr_ahs_ma2 %>%
  filter(extract_year %in% c(2008, 2012, 2016, 2020, 2022)) %>%  # pick a few years to keep it readable; every year will be too cluttered
  count(extract_year, status) %>%
  group_by(extract_year) %>%
  mutate(prop = n / sum(n)) %>%
  ungroup()

ggplot(alluvial_data,
       aes(x = factor(extract_year), y = n, stratum = status, alluvium = status,
           fill = status, label = status)) +
  geom_flow(alpha = 0.6) +
  geom_stratum() +
  labs(
    x = "Year",
    y = "Number of beneficiary-years",
    fill = "Enrollment status"
  ) +
  theme_minimal()

# Distribution of annual total payment ------------------------------------

# Check distribution
summary(mdcr_ahs_65_ffs$total_pmt_2022usd)

minor_breaks <- as.vector(outer(1:9, 10^(0:5)))
dollar_breaks <- c(0, 10, 100, 1000, 10000, 100000, 1000000)
dollar_labels <- c("$0", "$10", "$100", "$1,000", "$10K", "$100K", "$1M")

# Histogram of annual total payment, real, at person-year level
mdcr_ahs_65_ffs %>% 
  ggplot(aes(x = total_pmt_2022usd)) +
  geom_histogram(bins = 40) +
  scale_x_continuous(
    transform = scales::pseudo_log_trans(),
    breaks = dollar_breaks,
    labels = dollar_labels,
    minor_breaks = minor_breaks,
    limits = c(-.5, 2E6)
  ) +
  labs(x = "Annual total payment (2022 $), pseudo-log scale", y = "Frequency") +
  theme_bw()

# Average annual total payment per subject, nominal vs. real
avg_total_pmt_by_subject <- mdcr_ahs3 %>%
  group_by(bene_id, vegstat) %>%
  summarise(
    avg_total_pmt_nominal = mean(total_pmt, na.rm = TRUE),
    avg_total_pmt_2022usd = mean(total_pmt_2022usd, na.rm = TRUE),
    n_years = n(),
    .groups = "drop"
  )

# Check
avg_total_pmt_by_subject

# Distribution of years in Medicare
avg_total_pmt_by_subject %>% 
  count(n_years) %>% 
  mutate(pct = n / sum(n) * 100)

# Check mean, median, max
avg_total_pmt_by_subject %>% 
  select(starts_with("avg_")) %>% 
  summary()

# Histogram for average annual total payment per subject, real
minor_breaks <- as.vector(outer(1:9, 10^(0:5)))
dollar_breaks <- c(0, 10, 100, 1000, 10000, 100000, 1000000)
dollar_labels <- c("$0", "$10", "$100", "$1,000", "$10K", "$100K", "$1M")

avg_total_pmt_by_subject %>%
  ggplot(aes(x = avg_total_pmt_2022usd)) +
  geom_histogram(bins = 40) +
  scale_x_continuous(
    transform = scales::pseudo_log_trans(),
    breaks = dollar_breaks,
    labels = dollar_labels,
    minor_breaks = minor_breaks,
    limits = c(-.5, 1E6)
  ) +
  labs(x = "Average total payment (2022 $)") +
  theme_bw()

# Mean and median annual total payment by vegstat 
avg_total_pmt_by_subject %>% 
  filter(!is.na(vegstat)) %>% 
  group_by(vegstat) %>% 
  summarize(
    mean   = mean(avg_total_pmt_2022usd, na.rm = TRUE),
    # sd     = sd(avg_total_pmt_2022usd, na.rm = TRUE),
    median = median(avg_total_pmt_2022usd, na.rm = TRUE),
    q25    = quantile(avg_total_pmt_2022usd, 0.25, na.rm = TRUE),
    q75    = quantile(avg_total_pmt_2022usd, 0.75, na.rm = TRUE)
  )

# Trend of annual total payment -------------------------------------------

# Mean annual total payment
# Compare nominal and 2022 real $
mdcr_ahs_65_ffs %>% 
  group_by(extract_year, vegstat) %>%
  summarize(
    total_pmt = mean(total_pmt),
    total_pmt_2022usd = mean(total_pmt_2022usd)
  ) %>%
  pivot_longer(-(1:2), names_to = "var", values_to = "total_pmt") %>% 
  ggplot(aes(x = extract_year, y = total_pmt, color = vegstat)) +
  geom_point() +
  geom_line() +
  labs(
    x = "Year",
    y = "Mean annual total healthcare expenditure ($)"
  ) +
  scale_y_continuous(limits = c(0, NA)) +
  scale_color_discrete(
    name = "Dietary group",
    labels = c(
      "vegan"     = "Vegan",
      "lacto-ovo" = "Lacto-ovo vegetarian",
      "pesco"     = "Pesco-vegetarian",
      "semi"      = "Semi-vegetarian",
      "nonveg"    = "Non-vegetarian"
    )
  ) +
  facet_wrap(
    ~ var,
    labeller = labeller(var = c(
      total_pmt         = "Nominal dollars",
      total_pmt_2022usd = "2022 real dollars"
    ))
  ) +
  theme_bw() +
  theme(legend.position = "bottom")


# Two-stage hurdle model --------------------------------------------------

# Covariates (except for vegstat)
covars <- c(
  "cyear",
  "cage",
  "sex",
  "rti_race3",
  "region",
  "urban_rural",
  "educat3m",
  "marital",
  "smkcat",
  "alccat",
  "dual_elgbl_mons",
  "ptd_plan_cvrg_mons",
  "entlmt_rsn",
  "died_this_year"
)

add_covars <- paste(covars, collapse = " + ")

## Stage 1 GLMM Logistic --------------------------------------------------

# Formula for GLMM logistic
rhs <- paste(c(add_covars, "vegstat2", "(1 | bene_id)"), collapse = " + ")
fm  <- paste("I(total_pmt_2022usd_k > 0) ~ ", rhs) %>% as.formula()

# ~7 min
system.time({
  m_logistic <- glmmTMB(fm, family = binomial, data = mdcr_ahs_65_ffs)
})

summary(m_logistic)
tidy(
  m_logistic, 
  effects = "fixed", 
  exponentiate = TRUE, 
  conf.int = TRUE
) %>% 
print(n = Inf)

# No collinearity b/w age and year
performance::check_collinearity(m_logistic)

# Natural splines on age
# ~10 min
system.time({
  m_logistic_cage_ns <- update(m_logistic, . ~ . - cage + ns(cage, df = 3))
})

# Age spline is highly significant, p <.0001
anova(m_logistic, m_logistic_cage_ns)
summary(m_logistic_cage_ns)

# Still no collinearity
performance::check_collinearity(m_logistic_cage_ns)

tidy(m_logistic_cage_ns, effects = "fixed", exponentiate = TRUE, conf.int = TRUE) %>% 
  print(n = Inf)

# Natural splines on year 
# ~13 min
system.time({
  m_logistic_cyear_ns <- update(m_logistic, . ~ . - cyear + ns(cyear, df = 3))
})

# Year spline is highly significant, p <.0001
anova(m_logistic, m_logistic_cyear_ns)
summary(m_logistic_cyear_ns)

# Still no collinearity
performance::check_collinearity(m_logistic_cyear_ns)

tidy(m_logistic_cyear_ns, effects = "fixed", exponentiate = TRUE, conf.int = TRUE) %>% 
  print(n = Inf)

# Splines on both age and year 
# ~19 min
system.time({
  m_logistic_both_ns <- update(m_logistic, . ~ . - cage - cyear + ns(cage, df = 3) + ns(cyear, df = 3))
})

# Splines on both age and year is the best
AIC(m_logistic, m_logistic_cage_ns, m_logistic_cyear_ns, m_logistic_both_ns)
BIC(m_logistic, m_logistic_cage_ns, m_logistic_cyear_ns, m_logistic_both_ns)
anova(m_logistic_cage_ns, m_logistic_both_ns)

tidy(
  m_logistic_both_ns, 
  effects = "fixed", 
  exponentiate = TRUE, 
  conf.int = TRUE
) %>% 
  print(n = Inf)

performance::check_collinearity(m_logistic_both_ns)
diagnose(m_logistic_both_ns)

# Add vegstat x race interaction p = 0.0504
# ~23 min
system.time({
  m_logistic_both_ns_intx <- update(m_logistic_both_ns, . ~ . + vegstat2:rti_race3)
})

summary(m_logistic_both_ns_intx)
anova(m_logistic_both_ns, m_logistic_both_ns_intx)

# Add vegstat x sex interaction, not signfifianct at all 
# ~22 min
system.time({
  m_logistic_both_ns_intx2 <- update(m_logistic_both_ns, . ~ . + vegstat2:sex)
})

summary(m_logistic_both_ns_intx2)
anova(m_logistic_both_ns, m_logistic_both_ns_intx2)

# Model-predicted (population-averaged) probability by year x vegstat2
# Using avg_predictions() approach 
# this averages each row's fitted probability (accounting for its own
# covariates and its beneficiary's conditional mode / EBLUP) within each
# vegstat2 x extract_year cell, rather than a plug-in re.form=NA prediction.

model_pred_by_year <- avg_predictions(
  m_logistic_both_ns,
  by   = c("vegstat2", "extract_year"),
  type = "response"
) %>%
  as.data.frame()

# Shared label lookup, applied to both the raw and model-predicted data
veg_labels <- c(
  vegan      = "Vegan",
  `lacto-ovo` = "Lacto-ovo vegetarian",
  pesco      = "Pesco-vegetarian",
  semi       = "Semi-vegetarian",
  nonveg     = "Non-vegetarian"
)

nonzero_by_year <- nonzero_by_year %>%
  mutate(vegstat2_label = factor(veg_labels[as.character(vegstat)],
                                 levels = veg_labels))

model_pred_by_year <- model_pred_by_year %>%
  mutate(
    vegstat2_label = factor(veg_labels[as.character(vegstat2)], levels = veg_labels),
    estimate_pct   = estimate * 100,
    conf.low_pct   = conf.low * 100,
    conf.high_pct  = conf.high * 100
  )

# Overlay plot: raw points + model-predicted trend with CI ribbon
ggplot() +
  geom_ribbon(
    data = model_pred_by_year,
    aes(x = extract_year, ymin = conf.low_pct, ymax = conf.high_pct, fill = vegstat2_label),
    alpha = 0.15, color = NA
  ) +
  geom_point(
    data = nonzero_by_year,
    aes(x = extract_year, y = pct_nonzero, color = vegstat2_label),
    size = 1.5, alpha = 0.5
  ) +
  geom_line(
    data = model_pred_by_year,
    aes(x = extract_year, y = estimate_pct, color = vegstat2_label),
    linewidth = 1
  ) +
  scale_y_continuous(labels = scales::label_percent(scale = 1)) +
  labs(
    x = "Calendar year",
    y = "% of beneficiary-years with any positive payment",
    color = "Diet group",
    fill  = "Diet group",
    title = "Crude (points) vs. model-predicted (line, 95% CI) utilization rate",
    subtitle = "Model-predicted values are population-averaged from m_logistic_both_ns"
  ) +
  theme_minimal()


## Stage 2 GLMM Gamma -----------------------------------------------------

# Formula for GLMM Gamma 
rhs <- paste(c(add_covars, "vegstat2", "(1 | bene_id)"), collapse = " + ")
fm  <- paste("total_pmt_2022usd_k ~ offset(log(ab_entitled_months)) + ", rhs) %>% as.formula()

# GLMM lognormal with offset for Parts A and B coverage
# Model failed after 44 min
system.time({
m_lognormal <- glmmTMB(
  fm, family = lognormal,
  data = subset(mdcr_ahs_65_ffs, total_pmt_2022usd > 0 & ab_entitled_months > 0)
)
})

# Non-positive definite Hessian
diagnose(m_lognormal)
summary(m_lognormal)
tidy(m_lognormal, effects = "fixed", exponentiate = TRUE, conf.int = TRUE)

# GLMM gamma with offset for Parts A and B coverage
# 20 min
system.time({
m_gamma <- glmmTMB(
  fm, family = Gamma(link = "log"),
  data = subset(mdcr_ahs_65_ffs, total_pmt_2022usd > 0 & ab_entitled_months > 0)
)
})

tidy(
  m_gamma, 
  effects = "fixed", 
  exponentiate = TRUE, 
  conf.int = TRUE
) %>% 
  print(n = Inf)

# Natural splines on age
# 25 min
system.time({
  m_gamma_cage_ns <- update(m_gamma, . ~ . - cage + ns(cage, df = 3))
})

# Age spline is highly significant, p = 0.003
anova(m_gamma, m_gamma_cage_ns)
summary(m_gamma_cage_ns)

# Still no collinearity
performance::check_collinearity(m_gamma_cage_ns)

tidy(m_gamma_cage_ns, effects = "fixed", exponentiate = TRUE, conf.int = TRUE) %>% 
  print(n = Inf)

# Natural splines on year 
# 28 min
system.time({
  m_gamma_cyear_ns <- update(m_gamma, . ~ . - cyear + ns(cyear, df = 3))
})

# Year spline is highly significant, p <.0001
anova(m_gamma, m_gamma_cyear_ns)
summary(m_gamma_cyear_ns)

# Still no collinearity
performance::check_collinearity(m_gamma_cyear_ns)

tidy(m_gamma_cyear_ns, effects = "fixed", exponentiate = TRUE, conf.int = TRUE) %>% 
  print(n = Inf)

AIC(m_gamma, m_gamma_cage_ns, m_gamma_cyear_ns)
BIC(m_gamma, m_gamma_cage_ns, m_gamma_cyear_ns)

# Splines on both age and year
# 30 min
system.time({
  m_gamma_both_ns <- update(m_gamma, . ~ . - cage - cyear + ns(cage, df = 3) + ns(cyear, df = 3))
})

performance::check_collinearity(m_gamma_both_ns)
diagnose(m_gamma_both_ns)

tidy(
  m_gamma_both_ns, 
  effects = "fixed", 
  exponentiate = TRUE, 
  conf.int = TRUE
) %>% 
  print(n = Inf)

# Splines on both age and year is the best
AIC(m_gamma, m_gamma_cage_ns, m_gamma_cyear_ns, m_gamma_both_ns)
BIC(m_gamma, m_gamma_cage_ns, m_gamma_cyear_ns, m_gamma_both_ns)
anova(m_gamma_cage_ns, m_gamma_both_ns)
anova(m_gamma_cyear_ns, m_gamma_both_ns)

# Check interaction
# Interaction b/w vegstat and rti_race -- Significant p = 0.065
# 50 min
system.time({
  m_gamma_both_ns_intx <- update(m_gamma_both_ns, . ~ . + vegstat2:rti_race3)
})

anova(m_gamma_both_ns, m_gamma_both_ns_intx)

# Interaction b/w vegstat and sex -- not significant p = 0.2797
# 5 min
system.time({
  m_gamma_both_ns_intx <- update(m_gamma_both_ns, . ~ . + vegstat2:sex)
})

anova(m_gamma_both_ns, m_gamma_both_ns_intx)

# Check residual plots
plot(DHARMa::simulateResiduals(m_gamma_both_ns))

# Dispersion-varying model
# Add group-varying dispersion (shape) by vegstat2
system.time({
  m_gamma_both_ns_disp <- glmmTMB(
    formula(m_gamma_both_ns),
    dispformula = ~ vegstat2,
    family = Gamma(link = "log"),
    data = subset(mdcr_ahs_65_ffs, total_pmt_2022usd > 0 & ab_entitled_months > 0),
    start = list(
      beta  = fixef(m_gamma_both_ns)$cond,
      theta = getME(m_gamma_both_ns, "theta")  # may need glmmTMB-specific extraction; check ?glmmTMB start parameter docs if this errors
    ),
    control = glmmTMBControl(optCtrl = list(iter.max = 1000, eval.max = 1000))
  )
})

summary(m_gamma_both_ns_disp)
anova(m_gamma_both_ns, m_gamma_both_ns_disp)

tidy(
  m_gamma_both_ns_disp, 
  effects = "fixed", 
  exponentiate = TRUE, 
  conf.int = TRUE
) %>% 
  print(n = Inf)

# Convert to Gini
disp_coefs <- fixef(m_gamma_both_ns_disp)$disp
disp_coefs

log_shape <- c(
  nonveg      = unname(disp_coefs["(Intercept)"]),
  vegan       = unname(disp_coefs["(Intercept)"] + disp_coefs["vegstat2vegan"]),
  `lacto-ovo` = unname(disp_coefs["(Intercept)"] + disp_coefs["vegstat2lacto-ovo"]),
  pesco       = unname(disp_coefs["(Intercept)"] + disp_coefs["vegstat2pesco"]),
  semi        = unname(disp_coefs["(Intercept)"] + disp_coefs["vegstat2semi"])
)

shape_hat <- exp(log_shape)
shape_hat

gini_from_gamma_shape <- function(shape) {
  gamma(shape + 0.5) / (gamma(shape + 1) * sqrt(pi))
}

# Model-based, adjusted Gini
gini_by_group <- sapply(shape_hat, gini_from_gamma_shape)
gini_by_group

# Combine the both stages -------------------------------------------------

# population-averaged predictions from the two-part model were computed 
# accounting for between-beneficiary random-intercept heterogeneity (conditional mode)
# rather than by simple plug-in prediction

veg_levels <- levels(mdcr_ahs_65_ffs$vegstat2)
gamma_data <- subset(mdcr_ahs_65_ffs, total_pmt_2022usd > 0 & ab_entitled_months > 0)

compute_logit_avgpred <- function(veg_level, data, model) {
  nd <- data
  nd$vegstat2 <- factor(veg_level, levels = levels(data$vegstat2))
  avg_predictions(model, newdata = nd, type = "response")
}

compute_gamma_avgpred <- function(veg_level, data, model) {
  nd <- data
  nd$vegstat2 <- factor(veg_level, levels = levels(data$vegstat2))
  nd$ab_entitled_months <- 12
  avg_predictions(model, newdata = nd, type = "response")
}

# 40 mins
system.time({
  logit_results <- lapply(veg_levels, compute_logit_avgpred, data = mdcr_ahs_65_ffs, model = m_logistic_both_ns)
  gamma_results <- lapply(veg_levels, compute_gamma_avgpred, data = gamma_data, model = m_gamma_both_ns_disp)
})

names(logit_results) <- names(gamma_results) <- veg_levels

combined <- data.frame(
  vegstat2 = veg_levels,
  p_hat    = sapply(logit_results, function(x) x$estimate),
  se_p     = sapply(logit_results, function(x) x$std.error),
  mu_hat   = sapply(gamma_results, function(x) x$estimate),
  se_mu    = sapply(gamma_results, function(x) x$std.error)
)

combined$E_Y         <- combined$p_hat * combined$mu_hat
combined$se_EY       <- sqrt(combined$mu_hat^2 * combined$se_p^2 + combined$p_hat^2 * combined$se_mu^2)
combined$E_Y_dollars <- combined$E_Y * 1000
combined$ci_lo       <- (combined$E_Y - 1.96 * combined$se_EY) * 1000
combined$ci_hi       <- (combined$E_Y + 1.96 * combined$se_EY) * 1000

combined

ref <- combined[combined$vegstat2 == "nonveg", ]
combined$diff_vs_nonveg    <- combined$E_Y_dollars - ref$E_Y_dollars
combined$se_diff_vs_nonveg <- sqrt((combined$se_EY * 1000)^2 + (ref$se_EY * 1000)^2)
combined$diff_ci_lo <- combined$diff_vs_nonveg - 1.96 * combined$se_diff_vs_nonveg
combined$diff_ci_hi <- combined$diff_vs_nonveg + 1.96 * combined$se_diff_vs_nonveg

combined[, c("vegstat2", "E_Y_dollars", "diff_vs_nonveg", "diff_ci_lo", "diff_ci_hi")]

veg_labels <- c(
  vegan       = "Vegan",
  `lacto-ovo` = "Lacto-ovo vegetarian",
  pesco       = "Pesco-vegetarian",
  semi        = "Semi-vegetarian",
  nonveg      = "Non-vegetarian"
)
veg_order <- c("vegan", "lacto-ovo", "pesco", "semi", "nonveg")

combined <- combined %>%
  mutate(vegstat2_label = factor(veg_labels[as.character(vegstat2)],
                                 levels = veg_labels[veg_order]))

# Dot-whisker plot
ggplot(combined, aes(x = vegstat2_label, y = E_Y_dollars, color = vegstat2_label)) +
  geom_pointrange(aes(ymin = ci_lo, ymax = ci_hi), size = 0.8, linewidth = 1) +
  scale_y_continuous(labels = scales::label_dollar()) +
  labs(
    x = NULL,
    y = "Predicted mean annual total payment (2022 USD)",
    title = "Model-predicted marginal payment by diet group",
    subtitle = "Population-averaged estimate: Pr(any payment) x mean payment | positive, with 95% CI"
  ) +
  guides(color = "none") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 20, hjust = 1))

ggplot(combined, aes(x = vegstat2_label, y = E_Y_dollars, color = vegstat2_label)) +
  geom_pointrange(aes(ymin = ci_lo, ymax = ci_hi), size = 0.8, linewidth = 1) +
  scale_x_discrete(limits = rev(unname(veg_labels[veg_order]))) +
  scale_y_continuous(labels = scales::label_dollar(), limits = c(10000, 16000)) +
  coord_flip() +
  labs(
    x = NULL,
    y = "Predicted mean annual total payment (2022 USD)",
    title = "Model-predicted marginal payment by diet group",
    subtitle = "Population-averaged estimate: Pr(any payment) x mean payment | positive, with 95% CI"
  ) +
  guides(color = "none") +
  theme_minimal()


# Forest plots for vegstat ------------------------------------------------

# Label
part_order <- c("Probability of any payment (OR)", "Payment amount | positive (cost ratio)")

# Extract model estimates
logistic_terms <- tidy(m_logistic_both_ns, effects = "fixed", conf.int = TRUE, exponentiate = TRUE) %>%
  filter(grepl("^vegstat2", term)) %>%
  mutate(part = "Probability of any payment (OR)")

gamma_terms <- tidy(m_gamma_both_ns_disp, effects = "fixed", conf.int = TRUE, exponentiate = TRUE) %>%
  filter(grepl("^vegstat2", term)) %>%
  mutate(part = "Payment amount | positive (cost ratio)")

# Plot data
forest_data <- bind_rows(logistic_terms, gamma_terms) %>% 
  mutate(
    level       = gsub("^vegstat2", "", term),
    group_label = factor(veg_labels[level], levels = veg_labels[veg_order]),
    part = factor(part, levels = part_order)
  )

veg_palette <- setNames(scales::hue_pal()(5), unname(veg_labels[veg_order]))

# Reference-category rows
ref_data <- data.frame(
  group_label = factor(unname(veg_labels["nonveg"]), levels = unname(veg_labels[veg_order])),
  part        = unique(forest_data$part),
  estimate    = 1
) %>% 
  mutate(part = factor(part, levels = part_order))

# Forest plots, side by side
ggplot() +
  geom_hline(yintercept = 1, linetype = "dashed", color = "grey50") +
  geom_pointrange(
    data = forest_data,
    aes(x = group_label, y = estimate, ymin = conf.low, ymax = conf.high, color = group_label),
    size = 0.7, linewidth = 1
  ) +
  geom_point(
    data = ref_data,
    aes(x = group_label, y = estimate),
    shape = 18, size = 5, color = "black"
  ) +
  scale_y_log10(labels = scales::label_number(accuracy = 0.1)) +
  scale_color_manual(values = veg_palette, guide = "none") +
  scale_x_discrete(limits = rev(unname(veg_labels[veg_order]))) +
  coord_flip() +
  facet_wrap(~ part, scales = "free_x") +
  labs(
    x = NULL,
    y = "Estimate (log scale)",
    title = "Two-part model coefficients by diet group",
    subtitle = "Odds ratio for probability of any payment and cost ratio for payment amount given positive"
    # caption = "Diamond = reference category (Non-vegetarian, fixed at 1 by definition; no estimated CI)"
  ) +
  theme_minimal() +
  theme(
    panel.spacing      = unit(2, "lines"),
    strip.background   = element_rect(fill = "grey90", color = "grey40", linewidth = 0.5),
    strip.text         = element_text(face = "bold", size = 11),
    panel.border       = element_rect(color = "grey70", fill = NA, linewidth = 0.5)
  )
