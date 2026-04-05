# SAP to Analysis Code Framework Generation Workflow

## Overview

This SOP guides the automated generation of boilerplate analysis code frameworks based on a structured Statistical Analysis Plan (SAP). It creates foundational code for ADaM dataset creation, TFL (Tables, Figures, Listings) shells, and implements specified statistical models, significantly accelerating the clinical programming process while ensuring consistency with SAP requirements.  This SOP guides the generation of analysis code skeletons from Statistical Analysis Plans (SAPs), ensuring alignment with latest technology trends and best practices. It requires mandatory confirmation of technology stack before proceeding.

## Parameters

- **sap_path** (required): Path to the Statistical Analysis Plan document
- **output_language** (required): Programming language for generated code ("SAS" or "R")
- **output_dir** (required): Directory where code files will be generated
- **target_datasets** (optional, default: all): Array of specific ADaM datasets to generate
- **target_tfls** (optional, default: all): Array of specific TFLs to generate
- **include_comments** (optional, default: true): Whether to include detailed comments
- **code_style** (optional, default: "standard"): Programming style preferences
- **sap_document** (required): Statistical Analysis Plan document
  - File path or content of the SAP
  
- **technology_stack** (required): Programming technology stack
  - Must be specified by user
  - Examples: 
    - {"language": "SAS", "version": "9.4"}
    - {"language": "R", "version": "4.3"}
    - {"language": "Python", "version": "3.11"}
  - If not provided, must call technology_trends_intelligence first

- **code_generation_preferences** (optional): Code generation preferences
  - Examples: "use_templates", "ai_assisted", "manual"
  - 
**Constraints for parameter acquisition:**

- If all required parameters are already provided, You MUST proceed to the Steps
- If any required parameters are missing, You MUST ask for them before proceeding
- When asking for parameters, You MUST request all parameters in a single prompt
- When asking for parameters, You MUST use the exact parameter names as defined
- **CRITICAL**: technology_stack MUST be provided by user, cannot be auto-selected
## Steps

### 0. Pre-Generation: Requirements Assessment and Planning
Assess user requirements completeness and plan code generation approach.

**Constraints:**
- You MUST evaluate user requirements completeness and clarity
- You MUST assess technical feasibility of code generation
- You MUST evaluate how well different approaches fit user needs
- You MUST identify gaps between user requirements and technical capabilities
- You MUST propose alternative approaches when requirements cannot be fully met
- You MUST prioritize R programming language for code generation
- You MUST inform user about any requirements that cannot be fully met
- You MUST provide recommendations for requirement adjustments when needed

### 1. Pre-Generation: Technology Stack Confirmation (NEW)
Confirm technology stack with user before proceeding.

**Constraints:**
- You MUST confirm technology_stack is specified by user
- If technology_stack is not provided:
  - You MUST call `technology_trends_intelligence` with:
    - technology_domain: "statistical_libraries"
    - language_or_tool: "Python" (or user preference)
    - application_scenario: "clinical_data_analysis"
  - You MUST present available technology options to user
  - You MUST request user to specify technology stack
  - You MUST NOT auto-select any technology
- You MUST document technology stack confirmation
- You MUST ensure transparency about technology used

### 1. Technology Trends Retrieval (NEW)
Retrieve latest technology trends and recommendations.

**Constraints:**
- You MUST call `technology_trends_intelligence` with:
  - technology_domain: "statistical_libraries"
  - language_or_tool: [user-specified language]
  - version: [user-specified version]
  - application_scenario: "clinical_data_analysis"
- You MUST retrieve latest library versions
- You MUST assess compatibility
- You MUST identify best practices
- You MUST provide technology recommendations

### 1. SAP Analysis and Information Extraction

Parse SAP document and extract comprehensive programming specifications.

**Constraints:**

- You MUST call `doc_understand_structured` skill to parse SAP document
- You MUST extract ADaM dataset specifications and requirements
- You MUST identify all planned TFLs with their specifications
- You MUST extract statistical analysis methods and models
- You MUST document variable derivation rules and logic
- You MUST identify analysis populations and subsetting criteria
- You MUST preserve source references to SAP sections
- You MUST NOT skip any SAP sections; you MUST process systematically
- You MUST extract analysis specifications from SAP
- You MUST identify required analysis programs
- You MUST design macro functions
- You MUST consider technology stack compatibility

### 2. ADaM Code Framework Generation

Generate code frameworks for each planned ADaM dataset.

**Constraints:**

- You MUST create separate code file for each ADaM dataset specified in SAP
- You MUST generate code with standard file headers and library references
- You MUST include variable mapping from SDTM sources with comments
- You MUST create derivation logic frameworks for calculated variables
- You MUST add population flag variables as specified in SAP
- You MUST include QC and validation checks in generated code
- You MUST follow CDISC ADaM standards for dataset structures
- You SHOULD generate modular and reusable code structures
- You MUST preserve traceability to SAP specifications in comments
- You MUST generate code aligned with specified technology stack
- You MUST follow best practices from technology trends
- You MUST ensure code is production-ready
- You MUST include proper documentation

### 3. TFL Code Shell Generation

Create programming shells for all tables, figures, and listings.

**Constraints:**

- You MUST create individual program file for each TFL defined in SAP
- You MUST generate data processing and statistical procedure frameworks
- You MUST implement statistical summary frameworks based on TFL type
- You MUST create output structure and formatting code
- You MUST add grouping and subsetting logic as specified
- You MUST include standard TFL output formats and reporting structures
- You SHOULD follow organizational TFL programming standards
- You MUST add placeholder comments for complex logic requiring manual implementation

### 4. Statistical Model Implementation

Generate code for statistical models specified in SAP.

**Constraints:**

- You MUST generate code for each statistical model specified in SAP
- You MUST select appropriate SAS procedures or R functions based on model type
- You MUST set up model statements, class variables, model variables, and options correctly
- You MUST implement code to capture and format model outputs appropriately
- You MUST include diagnostic and validation code for models
- You MUST follow ICH E9 guidelines for statistical methods
- You SHOULD provide alternative model approaches when appropriate
- You MUST document model assumptions and requirements in comments

### 5. User Interaction Preparation
Prepare user interaction for confirmation.

**Constraints:**
- You MUST prepare clear interaction prompt
- You MUST provide complete technology information
- You MUST ask relevant clarifying questions
- You MUST ensure transparency

### 6. Comprehensive Report Generation
Generate comprehensive code skeleton report.

**Constraints:**
- You MUST include all technology considerations
- You MUST include code skeleton
- You MUST include user interaction prompt
- You MUST ensure complete transparency

## Examples

### Python-Based Code Skeleton Generation
**Input:**
```json
{
"sap_document": "/saps/study_123_sap.pdf",
"technology_stack": {
"language": "Python",
"version": "3.11"
}
}
```

**Output:** Comprehensive report including:
- Technology recommendations based on Python 3.11
- Code skeleton aligned with latest libraries
- User interaction prompt for confirmation

### 7. Supporting Files and Utilities Generation

Create global files and utility functions to support the generated code.

**Constraints:**

- You MUST generate global.sas or global.R with:
  - Library assignments and path configurations
  - Macro definitions or function definitions
  - Global options and settings
  - Common utility functions
- You MUST create utility macro library or helper functions
- You SHOULD generate format definitions for standard coding
- You MUST include standard header and footer templates
- You SHOULD provide example data for testing generated code
- You MUST ensure all supporting files are properly documented

### 8. Code Quality and Documentation Review

Ensure generated code meets quality standards and is well-documented.

**Constraints:**

- You MUST verify all generated files have proper structure and syntax
- You MUST confirm file headers contain correct source references to SAP
- You MUST validate that traceability to SAP is maintained throughout
- You MUST ensure code follows organizational programming standards
- You SHOULD review code for potential optimizations
- You MUST generate summary report of created files and manual implementation requirements
- You MUST identify all TODO comments and areas requiring programmer attention

## Examples

### Basic ADaM and TFL Framework Generation

**Input:**

```json
{
"sap_path": "study_sap.docx",
"output_language": "SAS",
"output_dir": "/projects/study001/programming/",
"target_datasets": ["ADSL", "ADLB", "ADAE"],
"target_tfls": ["Table 14.2.1", "Figure 14.3.1"]
}
```

**Output:** Complete code framework including:

- create_adsl.sas, create_adlb.sas, create_adae.sas with variable mappings and derivation logic
- tfl_table_14_2_1.sas and tfl_figure_14_3_1.sas with statistical procedure frameworks
- global.sas with library assignments and utility macros
- Summary report listing all generated files and manual implementation requirements

### Comprehensive Study Code Framework

**Input:**

```json
{
"sap_path": "oncology_study_sap.pdf",
"output_language": "R",
"output_dir": "/projects/oncology001/R_programming/",
"code_style": "enhanced"
}
```

**Output:** Full R programming framework including:

- All ADaM dataset creation scripts (create_adsl.R, create_adlb.R, create_adae.R, create_adtte.R)
- All TFL programming scripts with ggplot2 visualization frameworks
- Utility functions and helper scripts
- Global.R with package loading and configurations
- Comprehensive documentation and README

## Troubleshooting

### Issue: Technology stack not provided
**Solution:** Request user to provide technology stack, call technology_trends_intelligence, present options, do not auto-select

### Issue: Code not compatible with technology stack
**Solution:** Document incompatibility, suggest alternatives, adjust code generation

### Issue: SAP contains ambiguous or incomplete specifications

**Solution:** Generate code with detailed TODO comments and clear indicators of where manual implementation is required, flag for programmer review, provide examples or pseudo-code for complex logic.

### Issue: Complex derivation logic cannot be fully automated

**Solution:** Generate framework code with detailed comments explaining the required logic, provide examples or pseudo-code, reference relevant SAP sections, suggest consultation with statistician.

### Issue: Statistical model specifications are unclear

**Solution:** Generate basic model framework with comments indicating required parameters, suggest consultation with statistician, provide examples of common model implementations.

### Issue: TFL layout requirements are complex

**Solution:** Generate basic structure with comments for specific formatting requirements, provide examples of similar TFLs, suggest referencing organizational TFL standards.

### Issue: Code organization doesn't match team standards

**Solution:** Document organizational standards, adjust code structure accordingly, create template files for future use, update skill configuration.

### 9. Debug and Troubleshooting Enhancement
Enhance debug capabilities to ensure alignment with user requirements.

**Constraints:**
- You MUST continuously verify code generation against original requirements
- You MUST assess if technical framework can meet user needs
- You MUST detect when requirements exceed technical capabilities
- You MUST proactively inform users about potential limitations
- You MUST provide recommendations for requirement adjustments when technical constraints exist
- You MUST validate generated code for syntax and logical correctness
- You MUST implement robust error handling in generated code
- You MUST maintain traceability between requirements and generated code
- You MUST prioritize R programming language for code generation

## Quality Assurance

### Pre-Execution Checks

- Confirm technology_stack is provided
- Ensure access to technology trends intelligence- 
- Verify SAP document is accessible and readable
- Confirm output directory exists and is writable
- Validate output language is supported (SAS or R)
- Check that required libraries and tools are available
- Ensure SAP contains all necessary specifications

### Post-Execution Validation
- Verify technology_stack is confirmed with user
- Confirm technology_trends_intelligence was called
- Ensure code is compatible with specified technology stack
- Verify report includes all required sections
- Verify transparency about technology used- 
- Verify all expected files were generated
- Check that generated code has proper structure and syntax
- Validate that file headers contain correct source references
- Confirm that traceability to SAP is maintained
- Review TODO comments for manual implementation requirements
- Ensure code follows organizational programming standards

### Documentation Requirements

- Maintain clear file naming conventions
- Include standard headers in all generated files
- Document source references to SAP sections
- Provide implementation guidance for complex logic
- Generate summary report of created files
- List all areas requiring manual implementation
- Document technology stack confirmation process
- Preserve all technology trends intelligence
- Maintain clear audit trail
- Generate comprehensive report
- Ensure complete transparency