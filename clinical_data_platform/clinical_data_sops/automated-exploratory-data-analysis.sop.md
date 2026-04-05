# Automated Exploratory Data Analysis Workflow

## Overview
This SOP guides comprehensive automated exploratory data analysis (EDA) on clinical trial datasets. It systematically profiles data quality, identifies outliers and anomalies, checks distributions, visualizes relationships between variables, and generates detailed, actionable EDA reports essential for data quality assessment and database lock preparation.

## Parameters
- **dataset_path** (required): Path to the clinical dataset file (.xpt, .sas7bdat, .csv)
- **output_report_path** (required): Path where the EDA report will be saved
- **group_vars** (optional, default: []): Array of grouping variables for comparative analysis
- **time_vars** (optional, default: []): Array of time-related variables for trend analysis
- **key_variables** (optional, default: []): Array of key variables to focus analysis on
- **exclude_vars** (optional, default: []): Array of variables to exclude from analysis
- **analysis_depth** (optional, default: "standard"): Level of analysis detail ("basic", "standard", "comprehensive")
- **output_format** (optional, default: "html"): Report format ("html", "pdf", "markdown")

**Constraints for parameter acquisition:**
- If all required parameters are already provided, You MUST proceed to the Steps
- If any required parameters are missing, You MUST ask for them before proceeding
- When asking for parameters, You MUST request all parameters in a single prompt
- When asking for parameters, You MUST use the exact parameter names as defined

## Steps

### 1. Dataset Loading and Initial Profiling
Load dataset and generate initial data quality metrics.

**Constraints:**
- You MUST load dataset from specified file path
- You MUST detect file format and apply appropriate parser
- You MUST calculate basic statistics: row count, column count, memory usage
- You MUST identify variable types: numeric, character, date, factor
- You SHOULD validate data integrity and structure
- You MUST generate initial data quality metrics
- You MUST handle missing data appropriately in calculations
- You MUST NOT skip any variables unless explicitly excluded

### 2. Variable-Level Analysis
Perform detailed analysis for each variable in the dataset.

**Constraints:**
- You MUST analyze each variable systematically, not randomly
- For each variable, you MUST:
  - Calculate missing value count and percentage
  - Determine unique values and their frequencies
  - For numeric variables: calculate descriptive statistics (N, Mean, SD, Median, IQR, Min, Max)
  - For categorical variables: calculate frequency distributions and percentages
  - Identify potential outliers using statistical methods
  - Assess distribution shape and normality
- You MUST document all findings with source references
- You SHOULD identify variables with high missing rates (>20%)
- You MUST flag variables with unusual patterns or unexpected values

### 3. Univariate Statistical Analysis
Perform comprehensive statistical analysis on individual variables.

**Constraints:**

#### Numerical Variables Analysis
- You MUST calculate N, Mean, SD, Median, IQR, Min, Max
- You MUST generate histograms with density curves
- You MUST create Q-Q plots for normality assessment
- You MUST perform Shapiro-Wilk normality tests
- You MUST identify outliers using IQR method (1.5 × IQR rule)
- You MUST generate boxplots for outlier visualization
- You SHOULD assess skewness and kurtosis

#### Categorical Variables Analysis
- You MUST calculate frequency counts and percentages
- You MUST generate bar charts for distribution visualization
- You MUST identify rare categories (frequency < 5%)
- You MUST check for unexpected or misspelled categories
- You SHOULD assess category balance and distribution

### 4. Bivariate and Multivariate Analysis
Explore relationships between variables and groups.

**Constraints:**

#### Group Comparisons
- You MUST identify key grouping variables (treatment, site, visit)
- You MUST generate boxplots by group for numeric variables
- You MUST create grouped bar charts for categorical variables
- You MUST perform appropriate statistical tests (t-test, ANOVA, chi-square)
- You MUST calculate effect sizes and confidence intervals
- You SHOULD document statistical assumptions and limitations

#### Correlation Analysis
- You MUST calculate correlation matrix for numeric variables
- You MUST generate correlation heatmap visualization
- You MUST identify strong correlations (|r| > 0.7)
- You MUST perform correlation significance testing
- You SHOULD document potential multicollinearity issues

#### Time Series Analysis
- If time variables are present, you MUST explore trends over time
- You MUST generate line plots for longitudinal data
- You SHOULD identify patterns and seasonal variations
- You MUST assess temporal consistency

### 5. Data Quality Assessment
Perform comprehensive data quality checks and identify issues.

**Constraints:**

#### Missing Data Analysis
- You MUST calculate missing data patterns across variables
- You MUST generate missing data heatmap
- You MUST identify variables with high missing rates
- You MUST assess missing data mechanism (MCAR, MAR, MNAR)
- You SHOULD document potential causes of missing data

#### Outlier Detection
- You MUST apply IQR method for numeric variables
- You MUST use z-score method for normally distributed data
- You MUST flag extreme values for review
- You MUST generate outlier summary tables
- You SHOULD provide context for outlier interpretation

#### Consistency Checks
- You MUST validate logical relationships between variables
- You MUST check date ranges and temporal consistency
- You MUST verify cross-variable constraints
- You MUST identify potential data entry errors
- You SHOULD flag inconsistencies for human review

### 6. Visualization Generation
Create comprehensive set of visualizations for data exploration.

**Constraints:**
- You MUST create visualizations for all key analyses
- You MUST generate histograms for all numeric variables
- You MUST create boxplots for numeric variables by key groups
- You MUST generate bar charts for categorical variables
- You MUST create correlation heatmap for numeric variables
- You MUST generate missing data pattern visualization
- You SHOULD create scatter plots for variable relationships
- You MUST ensure all visualizations have clear titles and labels
- You MUST follow data visualization best practices

### 7. Report Generation
Compile all analyses into comprehensive, actionable report.

**Constraints:**
- You MUST compile all analyses into comprehensive report
- You MUST include executive summary with key findings
- You MUST provide detailed variable-level analysis
- You MUST document all identified issues with severity levels
- You MUST generate actionable recommendations for each issue
- You MUST create interactive HTML report with navigation
- You SHOULD include data quality score and metrics
- You MUST ensure report is comprehensive yet readable
- You MUST provide clear guidance for next steps

## Examples

### Basic ADSL Dataset EDA
**Input:**

```json
{
"dataset_path": "/data/study001/adsl.xpt",
"output_report_path": "/reports/study001/adsl_eda_report.html",
"group_vars": ["TRT01P"],
"analysis_depth": "standard"
}
```


**Output:** Comprehensive HTML EDA report including:
- Executive summary with data quality score
- Variable-by-variable analysis with statistics and visualizations
- Treatment group comparisons with statistical tests
- Data quality issues identified and categorized by severity
- Actionable recommendations for each issue

### Comprehensive ADaM Dataset EDA
**Input:**

```json
{
"dataset_path": "/data/study001/adlb.xpt",
"output_report_path": "/reports/study001/adlb_eda_report.html",
"group_vars": ["TRT01P", "AVISIT"],
"time_vars": ["ADY"],
"key_variables": ["PARAMCD", "AVAL", "BASE", "CHG"],
"analysis_depth": "comprehensive"
}
```


**Output:** Detailed EDA report including:
- Complete variable analysis with distribution assessments
- Treatment and visit group comparisons
- Time trend analysis for laboratory parameters
- Correlation analysis between related parameters
- Comprehensive data quality assessment with issue tracking

## Troubleshooting

### Issue: Dataset file cannot be read
**Solution:** Try alternative file readers, check file format, verify file path and permissions, attempt format conversion, flag for manual review.

### Issue: Large dataset causes memory issues
**Solution:** Use data sampling for initial analysis, implement chunked processing, suggest data subset, optimize memory usage, provide progress updates.

### Issue: Missing data patterns are complex
**Solution:** Apply advanced missing data analysis techniques, flag for expert review, document limitations, suggest multiple imputation approaches if appropriate.

### Issue: Outlier identification produces many false positives
**Solution:** Adjust detection thresholds, use multiple methods, emphasize need for clinical review, provide context for interpretation, suggest domain expert consultation.

### Issue: Visualization generation fails
**Solution:** Simplify complex plots, use alternative visualization methods, provide tabular summaries, check for data issues, suggest manual plot creation.

## Quality Assurance

### Pre-Execution Checks
- Verify dataset file is accessible and readable
- Confirm output directory exists and is writable
- Validate that required analysis libraries are available
- Check dataset size and estimate processing time
- Ensure sufficient system resources are available

### Post-Execution Validation
- Review generated report for completeness and accuracy
- Verify all visualizations are properly rendered
- Confirm all data quality issues are documented
- Validate that recommendations are specific and actionable
- Ensure report follows standard formatting and structure
- Check that all variables were analyzed unless excluded

### Documentation Requirements
- Maintain clear audit trail of analysis steps
- Document all statistical methods and assumptions
- Preserve source references for all findings
- Generate summary of analysis limitations
- Provide guidance for next steps based on findings
- Ensure report is reproducible and well-documented
