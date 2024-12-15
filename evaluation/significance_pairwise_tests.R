#########################################
#########################################
# Reading Data

# Set the import and export directories
import_directory <- "Scripts_Paper/experiment_data"
data_path <- "Scripts_Paper/significance_pairwise"

# Create the export directory if it doesn't exist
if (!dir.exists(export_directory)) {
  dir.create(export_directory)
}

# Assuming the CSV files are named Data_Model_01.csv", Data_Model_02.csv", ..., "Data_Model_20.csv"
file_paths <- paste0(import_directory, "/Data_Model_", 1:20, ".csv")

# Read the CSV files into a list
tabellen_array <- lapply(file_paths, read.csv)

# Remove models 12, 19, and 20 from the tabellen_array
tabellen_array <- tabellen_array[-c(12, 19, 20)]

# Combine all tables in a form suitable for visualization
combined_data <- bind_rows(tabellen_array, .id = "Group")

# Convert the "Group" column into an ordered factor
combined_data$Group <- factor(combined_data$Group, levels = as.character(1:(length(tabellen_array))))


#####################################################################
#####################################################################
# Function to perform pairwise non-parametric significance test

perform_significance_test <- function(data, x, y1, y2) {
  group1 <- data %>% filter(Group == y1) %>% pull(!!sym(x))
  group2 <- data %>% filter(Group == y2) %>% pull(!!sym(x))
  
  mean1 <- mean(group1, na.rm = TRUE)
  median1 <- median(group1, na.rm = TRUE)
  mean2 <- mean(group2, na.rm = TRUE)
  median2 <- median(group2, na.rm = TRUE)
  
  test_result <- wilcox.test(group1, group2,  paired = TRUE, conf.int = FALSE, alternative="two.sided")
  
  result <- list(
    test = test_result,
    mean1 = mean1,
    median1 = median1,
    mean2 = mean2,
    median2 = median2
  )
  
  return(result)
}

# Example usage
# X determines which Q_part is tested, Y1 and Y2 determine which models are tested
X <- "Q_part_8"  # Specify the Q_part column to test
Y1 <- "7"        # Specify the first model
Y2 <- "10"        # Specify the second model

# Perform the significance test
test_result <- perform_significance_test(combined_data, X, Y1, Y2)

# Print the test results
print(test_result$test)
print(paste("Model", Y1, "Mean:", test_result$mean1, "Median:", test_result$median1))
print(paste("Model", Y2, "Mean:", test_result$mean2, "Median:", test_result$median2))


#########################################
#########################################
##Analysis of k-Factor for RAGG

# Function to perform pairwise non-parametric significance test
perform_significance_test <- function(data, x, y1, y2) {
  group1 <- data %>% filter(Group == y1) %>% pull(!!sym(x))
  group2 <- data %>% filter(Group == y2) %>% pull(!!sym(x))
  
  test_result <- wilcox.test(group1, group2,  paired = TRUE, conf.int = FALSE, alternative="two.sided")
  
  return(test_result$p.value)
}

# Initialize an empty list to store results
results_list <- list()

# Loop over models 7 to 10 for pairwise comparisons
for (y1 in 7:10) {
  for (y2 in 7:10) {
    if (y1 < y2) {
      p_values <- c()
      for (x in paste0("Q_part_", 6:13)) {
        p_value <- perform_significance_test(combined_data, x, as.character(y1), as.character(y2))
        p_values <- c(p_values, p_value)
      }
      results_list[[paste(y1, y2, sep = "_")]] <- p_values
    }
  }
}

# Create a matrix to store the p-values
p_value_matrix <- matrix("", nrow = 4, ncol = 4)
rownames(p_value_matrix) <- colnames(p_value_matrix) <- paste0("Model ", 7:10)

# Fill the matrix with p-values
for (name in names(results_list)) {
  indices <- str_split(name, "_")[[1]]
  y1 <- as.integer(indices[1])
  y2 <- as.integer(indices[2])
  p_values <- results_list[[name]]
  p_value_matrix[y1 - 6, y2 - 6] <- paste(p_values, collapse = "; ")
}

# Print the p-value matrix
print(p_value_matrix)

p_value_matrix_RAGG_filepath <- file.path(data_path, "p_value_matrix_loop_RAGG.csv")
write.csv(as.data.frame(p_value_matrix), p_value_matrix_RAGG_filepath, row.names = TRUE)



#########################################
#########################################
##Analysis of loop number for SCGG

# Function to perform pairwise non-parametric significance test
perform_significance_test <- function(data, x, y1, y2) {
  group1 <- data %>% filter(Group == y1) %>% pull(!!sym(x))
  group2 <- data %>% filter(Group == y2) %>% pull(!!sym(x))
  
  test_result <- wilcox.test(group1, group2,  paired = TRUE, conf.int = FALSE, alternative="two.sided")
  
  return(test_result$p.value)
}

# Initialize an empty list to store results
results_list <- list()

# Loop over models 14 to 17 for pairwise comparisons
for (y1 in 14:17) {
  for (y2 in 14:17) {
    if (y1 < y2) {
      p_values <- c()
      for (x in paste0("Q_part_", 6:13)) {
        p_value <- perform_significance_test(combined_data, x, as.character(y1), as.character(y2))
        p_values <- c(p_values, p_value)
      }
      results_list[[paste(y1, y2, sep = "_")]] <- p_values
    }
  }
}

# Create a matrix to store the p-values
p_value_matrix <- matrix("", nrow = 4, ncol = 4)
rownames(p_value_matrix) <- colnames(p_value_matrix) <- paste0("Model ", 14:17)

# Fill the matrix with p-values
for (name in names(results_list)) {
  indices <- str_split(name, "_")[[1]]
  y1 <- as.integer(indices[1])
  y2 <- as.integer(indices[2])
  p_values <- results_list[[name]]
  p_value_matrix[y1 - 13, y2 - 13] <- paste(p_values, collapse = "; ")
}

# Print the p-value matrix
print(p_value_matrix)

# Save the matrix to a CSV file
print(p_value_matrix)

# Write the p_value_matrix to the defined filepath
p_value_matrix_SCGG_filepath <- file.path(data_path, "p_value_matrix_loop_SCGG.csv")
write.csv(as.data.frame(p_value_matrix), p_value_matrix_SCGG_filepath, row.names = TRUE)

