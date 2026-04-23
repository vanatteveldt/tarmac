# packages.R — run once after `renv::init()` to install all project dependencies
# Then run `renv::snapshot()` to record versions in renv.lock

pkgs <- c(
  # Core data science
  "tidyverse",        # dplyr, ggplot2, stringr, purrr, readr, tidyr, ...
  "lubridate",        # date handling (now part of tidyverse but explicit for clarity)

  # Text analysis — tidy workflow
  "tidytext",         # tidy text mining
  "textdata",         # sentiment lexicons (AFINN, Bing, NRC)
  "widyr",            # pairwise operations on tidy data

  # Text analysis — corpus workflow
  "quanteda",         # corpus, tokens, DFM
  "quanteda.textstats", # keyness, collocations, readability
  "quanteda.textplots", # wordclouds, network plots
  "quanteda.textmodels", # Wordfish, Wordscores, Naive Bayes

  # Topic modeling
  "topicmodels",      # LDA via C++ wrapper
  "stm",              # Structural Topic Models
  "ldatuning",        # metrics for choosing K

  # Word embeddings
  "word2vec",         # word2vec training and inference
  "text2map",         # Concept Mover's Distance

  # Machine learning / supervised classification
  "tidymodels",       # unified ML interface
  "textrecipes",      # text preprocessing for tidymodels
  "glmnet",           # regularised regression

  # Visualisation
  "ggwordcloud",      # word cloud geom for ggplot2
  "scales",           # axis formatting helpers
  "patchwork",        # combining ggplot2 plots

  # Data collection
  "httr2",            # modern HTTP client
  "jsonlite",         # JSON parsing

  # Reliability
  "irr",              # inter-rater reliability (Cohen's κ, Krippendorff's α)

  # Utilities
  "glue",             # string interpolation
  "fs",               # file system operations
  "here"              # project-relative paths
)

install.packages(pkgs)
