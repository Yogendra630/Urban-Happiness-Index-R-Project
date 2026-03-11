
Urban Happiness Index Analysis (R + Shiny)

Files:
- urban_happiness.csv : dataset
- analysis.R : data analysis script
- app.R : Shiny dashboard

How to run in VS Code:

1. Install R
2. Install required packages in R terminal:

install.packages("ggplot2")
install.packages("dplyr")
install.packages("corrplot")
install.packages("shiny")

3. Run analysis:

source("analysis.R")

4. Run dashboard:

shiny::runApp("app.R")
