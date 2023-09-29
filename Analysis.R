# Set up ----
install.packages(c("here", "pacman"))

# Import personal functions to use across scripts
source(here::here("scripts", "general_functions.R"))

# Packages ----

# Vector holding the list of packages that will be used
analysis_packs<-c("here")

# Install packages not yet installed
install_new_packs(analysis_packs)

# Load packages
load_my_packs(analysis_packs)



# Knit all rmarkdown files ----
## Make a list of all the rmd files in the repository
rmd_list <- list.files(path = here()
                       , pattern = ".Rmd"
                       , full.names = T
                       , recursive = T) 

readmes_list <- rmd_list |> 
  str_subset("README")

## Knit the all the README files
lapply(rmd_list, my_knit_md)

## Report session information
capture.output(sessionInfo()
               , file = here("output"
                             ,"SInf_analysis-master-script.txt"))