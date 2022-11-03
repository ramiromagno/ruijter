library(tidyverse)
library(readxl)

data_dir <- here::here("data-raw")
archive_path <- file.path(data_dir, "qpcrdatamethods.zip")
data_files <- dplyr::pull(dplyr::filter(unzip(archive_path, list = TRUE), grepl("technical_datasets", x = Name)), 1L)
unzip(archive_path, files = data_files, exdir = data_dir)
data_file_path <- file.path(data_dir, data_files)

sheets <- setdiff(readxl::excel_sheets(data_file_path), "annotation")
wells <- as.character(matrix(outer(LETTERS[1:16], 1:24, paste0), byrow = TRUE, nrow = 24))
sample_types <- c("std", "ntc")

read_amplification_data <- function(file, sheet) {

  # 384 well plate layout: A1..A24, B1..B24, .., P1..P24
  readxl::read_excel(path = file, sheet = sheet) %>%
    dplyr::mutate(well = wells, .after = 1L) %>%
    tidyr::pivot_longer(cols = -(1:2), names_to = "cycle", values_to = "fluor") %>%
    dplyr::mutate(dye = "SYBR", cycle = as.double(cycle), .after = 1L)
}

#
# 94 replicates 4 dilutions data set
#
# WARNING: Note that we reorder the copy number values as it seems that they
# are incorrect in the original data. They seem to be reversed, so 15,000 copies
# is actually 15, 1,500 is 150, etc..
#
ds_94_4_01 <- read_amplification_data(data_file_path, sheets[1])
ds_94_4_02 <-
  ds_94_4_01 %>%
  tidyr::separate(col = "reaction", into = c("target", "sample_type", "replicate"), sep = "_") %>%
  tidyr::separate(col = "sample_type", into = c("sample_type", "copies"), sep = "A", fill = "right") %>%
  dplyr::mutate(copies = dplyr::recode(copies,
    `15` = "15000",
    `150` = "1500",
    `1500` = "150",
    `15000` = "15"
  )) %>%
  dplyr::mutate(copies = dplyr::if_else(sample_type == "NTC", 0L, as.integer(copies))) %>%
  dplyr::mutate(sample_type = tolower(sample_type),
                replicate = as.integer(replicate),
                dilution = 15000 / copies) %>%
  dplyr::relocate(well, replicate, dye, target, sample_type, copies, dilution, cycle, fluor) %>%
  dplyr::arrange(sample_type, copies, replicate, cycle) %>%
  dplyr::mutate(
    well = factor(well, levels = wells),
    replicate = factor(replicate),
    dye = factor(dye),
    target = factor(target),
    sample_type = factor(sample_type, levels = sample_types),
    cycle = as.integer(cycle)
  )

#
# 384 replicates data set
#
ds_380_ntc <- c("359", "360", "383", "384")
ds_380_01 <- read_amplification_data(data_file_path, sheets[2])
ds_380_02 <-
  ds_380_01 %>%
  tidyr::separate(col = "reaction",
                  into = c("X1", "X2", "replicate"),
                  sep = "_") %>%
  dplyr::select(-(1:2)) %>%
  dplyr::mutate(
    well = factor(well, wells),
    cycle = as.integer(cycle),
    dye = factor(dye),
    replicate = factor(as.integer(replicate)),
    target = factor("MYCN"),
    sample_type = factor(dplyr::if_else(
      replicate %in% ds_380_ntc, # NTCs: mentioned in the paper.
      "ntc",
      "std"
    ), levels = sample_types),
    copies = dplyr::if_else(
      replicate %in% ds_380_ntc,
      0L,
      15000L
    ),
    dilution = 15000 / copies
  ) %>%
  dplyr::relocate(well,
                  replicate,
                  dye,
                  target,
                  sample_type,
                  copies,
                  dilution,
                  cycle,
                  fluor)

ds_competimer_01 <-
  readxl::read_excel(path = data_file_path, sheet = sheets[3]) %>%
  tidyr::pivot_longer(cols = -1L, names_to = "cycle", values_to = "fluor") %>%
  tidyr::separate(col = "reaction", into = c("X1", "X2", "replicate"), sep = "_") %>%
  dplyr::mutate(
    pct = dplyr::recode(X1, A = 0, B = 5, C= 10, D = 20, E = 30, `F` = 40, G = 50),
    conc = dplyr::recode(X2, A = 64, B = 16, C= 4, D = 1, E = 0.25, `F` = 0.0625, G = 0)
  ) %>%
  dplyr::mutate(dye = factor("SYBR"), cycle = as.double(cycle), .after = 1L) %>%
  dplyr::mutate(well = factor(NA_character_, levels = wells),
                target = factor("AluSx"),
                sample_type = factor(dplyr::if_else(conc == 0, 'ntc', 'std'), levels = sample_types),
                dilution = 64 / conc,
                replicate = factor(replicate),
                cycle = as.integer(cycle)) %>%
  dplyr::relocate(well, replicate, dye, pct, conc, target, sample_type, dilution, cycle, fluor) %>%
  dplyr::select(-c("X1", "X2"))


ds_94_4 <- ds_94_4_02
ds_380 <- ds_380_02
ds_competimer <- ds_competimer_01

usethis::use_data(ds_94_4, compress = "xz", overwrite = TRUE, version = 2)
usethis::use_data(ds_380, compress = "xz", overwrite = TRUE, version = 2)
usethis::use_data(ds_competimer, compress = "xz", overwrite = TRUE, version = 2)
