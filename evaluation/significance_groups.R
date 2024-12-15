# Loading Libraries
library(dplyr)
library(tidyr)
library(readr)
library(ggplot2)
library(coin)
library(FSA)

# Setting Paths
data_path <- "Scripts_Paper/significance_analysis/data"
output_path <- "Scripts_Paper/significance_analysis/results"

# List of all files in directory
files <- list.files(data_path, full.names = TRUE)

# Function for reading in the data and converting it into a long format
read_and_gather <- function(file) {
  data <- read_csv(file)
  data_long <- data %>%
    select(contains("Q_part")) %>%
    gather(key = "Question", value = "Likert_Score") %>%
    mutate(Group = basename(file)) 
  return(data_long)
}

# Read in all files and convert to a long format
all_data <- files %>%
  lapply(read_and_gather) %>%
  bind_rows()

# Customize group names according to your description
all_data$Group <- recode(all_data$Group,
                         "baseline1.csv" = "Baseline1",
                         "baseline2.csv" = "Baseline2",
                         "group1_model1.csv" = "Group1_K1",
                         "group1_model2.csv" = "Group1_K2",
                         "group2_model1.csv" = "Group2_K1",
                         "group2_model2.csv" = "Group2_K2",
                         "group2_model3.csv" = "Group2_K3",
                         "group2_model4.csv" = "Group2_K4",
                         "group3_model1.csv" = "Group3_K1",
                         "group3_model2.csv" = "Group3_K2",
                         "group3_model3.csv" = "Group3_K3",
                         "group3_model4.csv" = "Group3_K4")

# List of questions
questions <- paste0("Q_part_", 6:13)

# Loop over each question
for (question in questions) {
  # Filter data for the specific question
  question_data <- all_data %>%
    filter(Question == question)
  
  # Kruskal-Wallis test
  kruskal_result <- kruskal.test(Likert_Score ~ Group, data = question_data)
  print(kruskal_result)
  
  # Post-hoc analysis only if the Kruskal-Wallis test is significant
  if (kruskal_result$p.value < 0.05) {
    posthoc_result <- dunnTest(Likert_Score ~ Group, data = question_data, method = "bonferroni")
    
    # Filter results for p.adj < 0.05
    significant_results <- posthoc_result$res %>%
      filter(P.adj < 0.05)
    
    # Save results
    if (nrow(significant_results) > 0) {
      write_csv(significant_results, file.path(output_path, paste0(question, "_dunn_results.csv")))
    }
  }
}

