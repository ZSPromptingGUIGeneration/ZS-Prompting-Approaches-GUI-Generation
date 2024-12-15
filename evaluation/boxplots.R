############################
########## Boxplots new ####

# Load necessary library
library(dplyr)
library(tidyverse)
library(ggpattern)

# Set the import and export directories
import_directory <- "Scripts_Paper/experiment_data"
export_directory <- "Scripts_Paper/boxplots"

# Create the export directory if it doesn't exist
if (!dir.exists(export_directory)) {
  dir.create(export_directory)
}

# Assuming the CSV files are named Data_Model_01.csv", Data_Model_02.csv", ..., "Data_Model_20.csv"
file_paths <- paste0(import_directory, "/Data_Model_", 1:20, ".csv")

# Read the CSV files into a list
tabellen_array <- lapply(file_paths, read.csv)

tabellen_array

# Remove models 12, 19, and 20 from the tabellen_array
tabellen_array <- tabellen_array[-c(12, 19, 20)]

# Combine all tables in a form suitable for visualization
combined_data <- bind_rows(tabellen_array, .id = "Group")

# Convert the "Group" column into an ordered factor
combined_data$Group <- factor(combined_data$Group, levels = as.character(1:(length(tabellen_array))))

# Create a mapping of groups to colors
group_colors <- c(rep("#A8C8E8", 3), rep("#EAC3B4", 3), rep("#B4EBAC", 7), rep("#EBC27E", 7))
# Adjust colors to match the new reduced number of groups

group_colors <- group_colors[-c(12, 19, 20)]
names(group_colors) <- as.character(1:(length(tabellen_array)))

# Define patterns for specific models
pattern_models <- c("3", "6", "11", "17")
patterns <- ifelse(combined_data$Group %in% pattern_models, "stripe", "none")

# List of titles
titles <- c(
  "This GUI prototype fulfills all functions defined in the GUI task description.",
  "The GUI prototype's feature set is extensive, clearly exceeding the GUI task description by implementing additional useful functions.",
  "The features were perfectly implemented for the given GUI prototyping task.",
  "The organization of information on the GUI prototype page is clear.",
  "The visual design of the GUI prototype is appealing.",
  "This single page GUI prototype has only minimal errors.",
  "Overall, I am satisfied with this GUI prototype.",
  "The presented GUI prototype looks like a screen from a complete app."
)

# New labels for x-axis
model_labels <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16","17")

# Create the boxplots for each Q_part column
for (i in 6:13) {
  column_name <- paste0("Q_part_", i)
  title <- titles[i - 5]  # Assign titles in sequence
  p <- ggplot(combined_data, aes_string(x = "Group", y = column_name, fill = "Group")) +
    geom_boxplot_pattern(aes(pattern = patterns), pattern_fill = "white", pattern_density = 0.1, pattern_spacing = 0.05) +
    stat_summary(fun = mean, geom = "point", color = "black", shape = 17, size = 3) +  # Change to black triangle
    scale_fill_manual(values = group_colors) +
    scale_pattern_manual(values = c("stripe" = "stripe", "none" = "none")) +
    labs(y = "Likert Scale Answers") +  # Wrap title into multiple lines
    scale_y_continuous(breaks = 0:9) +  # Set y-axis to whole numbers from 0 to 9
    scale_x_discrete(labels = model_labels) +  # Set x-axis labels to the new model labels
    theme(axis.text.x = element_text(face = "bold", size = 16),  # Rotate x-axis labels 45 degrees, bold, and increase size
          axis.text.y = element_text(face = "bold", size = 16),  # Bold and increase size of y-axis labels
          plot.title = element_text(size = 10, face = "bold", lineheight = 1.2),
          legend.position = "none",
          axis.title.x = element_blank())  # Remove x-axis label
  
  # Save the plot as a PNG file in the export directory with aspect ratio
  ggsave(filename = paste0(export_directory, "/Boxplot_", column_name, ".png"), plot = p, height = 7, width = 8.2, units = "in", dpi = 300)
}