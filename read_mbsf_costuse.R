# ============================================================================
# read_mbsf_costuse.R
#
# Reader for the CMS CCW MBSF "Cost and Use Segment" fixed-width extracts
# (data use agreement / researcher 000058038, requests 12172 and 14345).
#
# Column layout (positions, widths, types) was parsed directly out of the
# `input` statement in mbsf_costuse_read_v8.sas and cross-checked against
# the matching .fts file. That layout was verified to be byte-for-byte
# identical (same 83 variables, same start/width, lrecl = 826) across every
# extract year from 2008 through 2022 -- only the header comments (compile
# date, request title) differ between years. So one fixed layout below
# covers all years; only the source .dat file path changes.
#
# Folder layout on disk (relative to the "Data" folder):
#   Data/12172/<year>/mbsf_costuse_res000058038_req012172_<year>.dat   2008-2020
#   Data/14345/<year>/mbsf_costuse_res000058038_req014345_<year>.dat  2021-2022
#
# These functions assume the R working directory is ONE FOLDER UP FROM
# "Data" -- i.e. the working directory IS "Data"'s parent folder
# (egg_cvd_composite/, which also holds Results/ and the .Rproj), with
# "Data" as an immediate subfolder of it. So the default data_root is
# simply "Data". Pass a different data_root if your working directory is
# set up differently.
# ============================================================================

library(readr)
library(dplyr)

# ---------------------------------------------------------------------------
# Fixed column layout for mbsf_costuse (83 variables, lrecl = 826)
# type codes follow readr::read_fwf() col_types shorthand:
#   "c" = character, "i" = integer, "d" = double
# ---------------------------------------------------------------------------
mbsf_costuse_layout <- tibble::tribble(
  ~name,                  ~start, ~end,  ~type,
  "BENE_ID",                   1L,   15L, "c",
  "BENE_ENROLLMT_REF_YR",     16L,   19L, "i",
  "ENRL_SRC",                 20L,   22L, "c",
  "HOP_MDCR_PMT",             23L,   34L, "d",
  "HOP_BENE_PMT",             35L,   46L, "d",
  "HOP_PRMRY_PMT",            47L,   58L, "d",
  "HOP_VISITS",               59L,   64L, "i",
  "ACUTE_MDCR_PMT",           65L,   76L, "d",
  "ACUTE_BENE_PMT",           77L,   88L, "d",
  "ACUTE_PRMRY_PMT",          89L,  100L, "d",
  "ACUTE_PERDIEM_PMT",       101L,  112L, "d",
  "ACUTE_COV_DAYS",          113L,  118L, "i",
  "OIP_MDCR_PMT",            119L,  130L, "d",
  "OIP_BENE_PMT",            131L,  142L, "d",
  "OIP_PRMRY_PMT",           143L,  154L, "d",
  "OIP_PERDIEM_PMT",         155L,  166L, "d",
  "OIP_COV_DAYS",            167L,  172L, "i",
  "SNF_MDCR_PMT",            173L,  184L, "d",
  "SNF_BENE_PMT",            185L,  196L, "d",
  "SNF_PRMRY_PMT",           197L,  208L, "d",
  "SNF_COV_DAYS",            209L,  214L, "i",
  "HOS_MDCR_PMT",            215L,  226L, "d",
  "HOS_PRMRY_PMT",           227L,  238L, "d",
  "HOS_COV_DAYS",            239L,  244L, "i",
  "HH_MDCR_PMT",             245L,  256L, "d",
  "HH_PRMRY_PMT",            257L,  268L, "d",
  "HH_VISITS",               269L,  274L, "i",
  "ASC_MDCR_PMT",            275L,  286L, "d",
  "ASC_BENE_PMT",            287L,  298L, "d",
  "ASC_PRMRY_PMT",           299L,  310L, "d",
  "ASC_EVENTS",              311L,  316L, "i",
  "PTB_DRUG_MDCR_PMT",       317L,  328L, "d",
  "PTB_DRUG_BENE_PMT",       329L,  340L, "d",
  "PTB_DRUG_PRMRY_PMT",      341L,  352L, "d",
  "PTB_DRUG_EVENTS",         353L,  358L, "i",
  "EM_MDCR_PMT",             359L,  370L, "d",
  "EM_BENE_PMT",             371L,  382L, "d",
  "EM_PRMRY_PMT",            383L,  394L, "d",
  "EM_EVENTS",               395L,  400L, "i",
  "ANES_MDCR_PMT",           401L,  412L, "d",
  "ANES_BENE_PMT",           413L,  424L, "d",
  "ANES_PRMRY_PMT",          425L,  436L, "d",
  "ANES_EVENTS",             437L,  442L, "i",
  "DIALYS_MDCR_PMT",         443L,  454L, "d",
  "DIALYS_BENE_PMT",         455L,  466L, "d",
  "DIALYS_PRMRY_PMT",        467L,  478L, "d",
  "DIALYS_EVENTS",           479L,  484L, "i",
  "OPROC_MDCR_PMT",          485L,  496L, "d",
  "OPROC_BENE_PMT",          497L,  508L, "d",
  "OPROC_PRMRY_PMT",         509L,  520L, "d",
  "OPROC_EVENTS",            521L,  526L, "i",
  "IMG_MDCR_PMT",            527L,  538L, "d",
  "IMG_BENE_PMT",            539L,  550L, "d",
  "IMG_PRMRY_PMT",           551L,  562L, "d",
  "IMG_EVENTS",              563L,  568L, "i",
  "TEST_MDCR_PMT",           569L,  580L, "d",
  "TEST_BENE_PMT",           581L,  592L, "d",
  "TEST_PRMRY_PMT",          593L,  604L, "d",
  "TEST_EVENTS",             605L,  610L, "i",
  "DME_MDCR_PMT",            611L,  622L, "d",
  "DME_BENE_PMT",            623L,  634L, "d",
  "DME_PRMRY_PMT",           635L,  646L, "d",
  "DME_EVENTS",              647L,  652L, "i",
  "OTHC_MDCR_PMT",           653L,  664L, "d",
  "OTHC_BENE_PMT",           665L,  676L, "d",
  "OTHC_PRMRY_PMT",          677L,  688L, "d",
  "OTHC_EVENTS",             689L,  694L, "i",
  "HOP_ER_VISITS",           695L,  700L, "i",
  "IP_ER_VISITS",            701L,  706L, "i",
  "ACUTE_STAYS",             707L,  712L, "i",
  "OIP_STAYS",               713L,  718L, "i",
  "SNF_STAYS",               719L,  724L, "i",
  "HOS_STAYS",               725L,  730L, "i",
  "READMISSIONS",            731L,  736L, "i",
  "PHYS_MDCR_PMT",           737L,  748L, "d",
  "PHYS_BENE_PMT",           749L,  760L, "d",
  "PHYS_PRMRY_PMT",          761L,  772L, "d",
  "PHYS_EVENTS",             773L,  778L, "i",
  "PTD_EVENTS",              779L,  784L, "i",
  "PTD_FILL_CNT",            785L,  790L, "i",
  "PTD_TOTAL_RX_CST",        791L,  802L, "d",
  "PTD_MDCR_PMT",            803L,  814L, "d",
  "PTD_BENE_PMT",            815L,  826L, "d"
)

# Sanity check the embedded layout every time this file is sourced: catches
# a copy/paste mistake immediately instead of producing silently-misaligned
# data downstream.
stopifnot(
  nrow(mbsf_costuse_layout) == 83,
  max(mbsf_costuse_layout$end) == 826,
  all(mbsf_costuse_layout$start[-1] == mbsf_costuse_layout$end[-nrow(mbsf_costuse_layout)] + 1)
)

# ---------------------------------------------------------------------------
# Which CCW request folder holds a given extract year, and the .dat filename
# CMS used for it. Folder "12172" covers 2008-2020; "14345" covers 2021-2022.
# ---------------------------------------------------------------------------
mbsf_costuse_path <- function(year, data_root = "Data") {
  request_id <- dplyr::case_when(
    year >= 2008 & year <= 2020 ~ "12172",
    year %in% c(2021, 2022)     ~ "14345",
    TRUE ~ NA_character_
  )
  if (is.na(request_id)) {
    stop(
      "No known CCW request folder for year ", year,
      ". mbsf_costuse_path() only knows about 2008-2022 -- update it if a ",
      "new extract has been added."
    )
  }

  file.path(
    data_root, request_id, year,
    sprintf("mbsf_costuse_res000058038_req0%s_%d.dat", request_id, year)
  )
}

# ---------------------------------------------------------------------------
# Read one year of the MBSF Cost & Use Segment extract.
#
#   year       extract year, 2008-2022
#   data_root  path to the "Data" folder; defaults to "Data" (i.e. the
#              working directory is assumed to be "Data"'s parent folder)
#   col_select optional character vector of column names to keep, to speed
#              up reading when you only need a few columns. BENE_ID is
#              always included. NULL (default) reads every column.
#
# Returns a tibble with one row per beneficiary-year, plus an EXTRACT_YEAR
# column recording which year's file the row came from.
# ---------------------------------------------------------------------------
read_mbsf_costuse <- function(year, data_root = "Data", col_select = NULL) {

  path <- mbsf_costuse_path(year, data_root)
  if (!file.exists(path)) {
    stop("File not found: ", path)
  }

  layout <- mbsf_costuse_layout
  if (!is.null(col_select)) {
    col_select <- union("BENE_ID", col_select)
    unknown <- setdiff(col_select, layout$name)
    if (length(unknown) > 0) {
      stop("Unknown column(s) in col_select: ", paste(unknown, collapse = ", "))
    }
    layout <- layout[layout$name %in% col_select, ]
  }

  out <- read_fwf(
    path,
    col_positions = fwf_positions(
      start     = layout$start,
      end       = layout$end,
      col_names = layout$name
    ),
    col_types = paste(layout$type, collapse = ""),
    na        = c("", "NA"),
    trim_ws   = TRUE
  )

  out$EXTRACT_YEAR <- year
  dplyr::relocate(out, EXTRACT_YEAR, .after = BENE_ID)
}

# ---------------------------------------------------------------------------
# Read and stack multiple years at once.
# ---------------------------------------------------------------------------
read_mbsf_costuse_years <- function(years = 2008:2022,
                                     data_root = "Data",
                                     col_select = NULL) {
  dplyr::bind_rows(
    lapply(years, read_mbsf_costuse, data_root = data_root, col_select = col_select)
  )
}

# ---------------------------------------------------------------------------
# Example usage (not run automatically):
#
#   source("read_mbsf_costuse.R")
#
#   # one year, all 83 columns
#   cu_2015 <- read_mbsf_costuse(2015)
#
#   # one year, a handful of columns
#   cu_2021 <- read_mbsf_costuse(2021, col_select = c("ACUTE_MDCR_PMT", "ACUTE_COV_DAYS"))
#
#   # every year 2008-2022, stacked into one tibble
#   cu_all <- read_mbsf_costuse_years(2008:2022)
# ---------------------------------------------------------------------------
