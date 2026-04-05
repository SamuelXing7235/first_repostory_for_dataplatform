# Interactive Dashboard Framework Generation Workflow

## Overview
This SOP guides the automated generation of interactive analysis dashboard frameworks, primarily using R Shiny. It transforms static analysis results (TFLs) into interactive, explorable dashboards by creating UI layouts, server logic stubs, and necessary reactivity structures, enabling clinical teams to interactively analyze and visualize clinical trial data.  This SOP guides the generation of interactive dashboard frameworks for clinical data analysis, ensuring alignment with latest technology trends and best practices. It requires mandatory confirmation of technology stack before proceeding.

## Parameters
- **dashboard_requirements** (required): 
  - File path or content of requirements

- **output_dir** (required): Directory where dashboard code will be generated
- **use_modules** (optional, default: true): Whether to use Shiny Modules for modular design
- **include_examples** (optional, default: true): Whether to include example data
- **styling_framework** (optional): Framework to use for styling ("bootstrap", "shinydashboard", "custom")
- **frontend_technology** (required): Frontend technology stack
  - Must be specified by user
  - Examples: 
    - {"framework": "React", "version": "18"}
    - {"framework": "Vue", "version": "3"}
    - {"framework": "Shiny", "version": "1.7"}
  - If not provided, must call technology_trends_intelligence first
  
- **backend_technology** (required): Backend technology stack
  - Must be specified by user
  - Examples:
    - {"framework": "Flask", "version": "3.0"}
    - {"framework": "FastAPI", "version": "0.104"}
    - {"framework": "Plumber", "version": "1.2"}

- **deployment_environment** (optional): Deployment environment
  - Examples: "local", "server", "cloud", "docker"
  - 
**Constraints for parameter acquisition:**
- If all required parameters are already provided, You MUST proceed to the Steps
- If any required parameters are missing, You MUST ask for them before proceeding
- When asking for parameters, You MUST request all parameters in a single prompt
- When asking for parameters, You MUST use the exact parameter names as defined
- **CRITICAL**: frontend_technology and backend_technology MUST be provided by user, cannot be auto-selected
- 
## Steps

### 0. Pre-Generation: Technology Stack Confirmation (NEW)
Confirm technology stack with user before proceeding.

**Constraints:**
- You MUST confirm frontend_technology and backend_technology are specified by user
- If not provided:
  - You MUST call `technology_trends_intelligence` with:
    - technology_domain: "system_architecture"
    - language_or_tool: "React" (or user preference)
    - application_scenario: "data_visualization"
  - You MUST present available technology options to user
  - You MUST request user to specify technology stack
  - You MUST NOT auto-select any technology
- You MUST document technology stack confirmation
- You MUST ensure transparency about technology used

### 1. Technology Trends Retrieval (NEW)
Retrieve latest technology trends for dashboard development.

**Constraints:**
- You MUST call `technology_trends_intelligence` with:
  - technology_domain: "system_architecture"
  - language_or_tool: [user-specified framework]
  - version: [user-specified version]
  - application_scenario: "data_visualization"
- You MUST retrieve latest framework versions
- You MUST assess compatibility
- You MUST identify best practices
- You MUST provide architecture recommendations
  
### 1. Dashboard Requirements Understanding and Analysis
Analyze dashboard requirements and understand data sources and visualization needs.

**Constraints:**
- You MUST extract dashboard requirements
- You MUST identify target datasets and their structures
- You MUST determine visualization types and chart requirements
- You MUST understand filtering and interaction needs
- You SHOULD consider user workflows and navigation patterns
- You MUST assess performance and scalability requirements
- You MUST NOT proceed if requirements are incomplete or unclear 
- Analyze requirements and design architecture.
- You MUST design system architecture
- You MUST identify components and interfaces
- You MUST consider technology stack compatibility
  
### 3. Dashboard Framework Generation
Generate dashboard framework.

**Constraints:**
- You MUST generate framework aligned with specified technology stack
- You MUST follow best practices from technology trends
- You MUST ensure framework is production-ready
- You MUST include proper documentation
  
### 2. UI Layout Generation (ui.R)
Create user interface layout with appropriate controls and output placeholders.

**Constraints:**
- You MUST prepare clear interaction prompt
- You MUST provide complete technology information
- You MUST ask relevant clarifying questions
- You MUST ensure transparency
- You MUST create main application structure (app.R or separate ui.R)
- You MUST generate UI layout based on specified framework (sidebar, navbar, etc.)
- You MUST create input controls for each specified filter:
  - `selectInput` for treatment group selection
  - `sliderInput` for time range selection
  - `checkboxGroupInput` for adverse event grade selection
  - `dateRangeInput` for date filtering
  - `radioButtons` for population selection
- You MUST generate output placeholders for each visualization:
  - `plotOutput` for visualizations
  - `dataTableOutput` for tabular data
  - `htmlOutput` for text summaries
- You SHOULD implement responsive design principles
- You MUST integrate with specified styling framework
- You MUST ensure UI is intuitive and user-friendly

### 3. Server Logic Generation (server.R)
Create server logic with reactive expressions and render functions.

**Constraints:**
- You MUST create server function structure
- You MUST generate reactive expressions for dynamic data filtering based on UI inputs
- You MUST implement data processing and transformation logic
- You MUST create renderPlot functions with ggplot2 or other visualization libraries
- You MUST implement renderDataTable functions with formatting and filtering options
- You MUST establish proper reactive dependencies and isolate reactive contexts
- You MUST include error handling and user feedback mechanisms
- You SHOULD implement efficient data filtering and processing
- You MUST ensure reactivity is properly managed to avoid performance issues

### 4. Modular Design Implementation (if requested)
Implement modular code structure using Shiny Modules.

**Constraints:**
- You MUST identify reusable components for modularization
- You MUST create module UI and server functions
- You MUST implement proper module namespacing to avoid conflicts
- You MUST establish communication patterns between modules
- You MUST design for easy addition of new features and components
- You SHOULD follow Shiny Modules best practices
- You MUST ensure modules are properly integrated
- You MUST document module interfaces and usage

### 5. Supporting Files Generation
Create global files, utility functions, and example data.

**Constraints:**
- You MUST generate global.R file with:
  - Loading necessary R packages
  - Setting global options and configurations
  - Defining global variables and constants
  - Implementing utility functions
- You MUST create utility functions in R/helpers.R
- You SHOULD provide small example datasets for testing and demonstration
- You MUST include custom CSS and JavaScript in www/ directory if needed
- You MUST generate README files with setup and usage instructions
- You SHOULD include configuration files for easy customization
- You MUST ensure all supporting files are properly documented

### 5. Comprehensive Report Generation
Generate comprehensive framework report.

**Constraints:**
- You MUST include all technology considerations
- You MUST include dashboard framework
- You MUST include user interaction prompt
- You MUST ensure complete transparency
  
### 6. Documentation and Testing Guidance
Create comprehensive documentation and testing guidance.

**Constraints:**
- You MUST create comprehensive README with setup and usage instructions
- You MUST add code comments explaining framework structure
- You SHOULD provide examples of how to extend the dashboard
- You MUST include testing guidelines and best practices
- You SHOULD provide troubleshooting guidance for common issues
- You MUST document all dependencies and package requirements
- You SHOULD include examples of common customizations


## Examples

### React-FastAPI Dashboard Framework
**Input:**
```json
{
"dashboard_requirements": "/requirements/dashboard_req.pdf",
"frontend_technology": {
"framework": "React",
"version": "18.2"
},
"backend_technology": {
"framework": "FastAPI",
"version": "0.104.1"
}
}
```
**Output:** Comprehensive report including:
- Technology recommendations based on React 18.2 and FastAPI 0.104.1
- Dashboard framework aligned with latest practices
- User interaction prompt for confirmation
  
### Basic Safety Dashboard
**Input:**

```json
{
"dashboard_requirements": {
"target_datasets": ["ADAE", "ADSL"],
"visualizations": [
{
"type": "bar_chart",
"title": "Adverse Events by System Organ Class",
"data_source": "ADAE"
}
],
"filters": [
{
"type": "treatment_group",
"variable": "TRT01P",
"widget": "selectInput"
},
{
"type": "ae_grade",
"variable": "AESEV",
"widget": "sliderInput"
}
],
"layout": "sidebar"
},
"output_dir": "/dashboards/safety_dashboard/",
"styling_framework": "shinydashboard"
}
```


**Output:** Complete R Shiny dashboard framework including:
- app.R with main application structure
- ui.R with sidebar layout and filter controls
- server.R with reactive data filtering and plot rendering
- global.R with package loading and configurations
- Example data files for testing
- Comprehensive README with setup instructions

### Complex Efficacy Dashboard with Modules
**Input:**
```json
{
"dashboard_requirements": {
"target_datasets": ["ADSL", "ADLB", "ADTTE"],
"visualizations": [
{
"type": "forest_plot",
"title": "Treatment Effect Forest Plot",
"data_source": "custom_analysis"
},
{
"type": "kaplan_meier",
"title": "Survival Analysis",
"data_source": "ADTTE"
}
],
"filters": [
{
"type": "treatment_group",
"variable": "TRT01P",
"widget": "selectInput"
},
{
"type": "subgroup",
"variable": "AGEGR1",
"widget": "checkboxGroupInput"
}
],
"layout": "navbar"
},
"output_dir": "/dashboards/efficacy_dashboard/",
"use_modules": true,
"styling_framework": "bootstrap"
}
```

**Output:** Modular R Shiny dashboard framework including:
- Main app.R with module integration
- Separate module files for each visualization type
- Modular UI and server components
- Advanced filtering and interaction capabilities
- Comprehensive documentation and examples

## Troubleshooting

### Issue: Technology stack not provided
**Solution:** Request user to provide technology stack, call technology_trends_intelligence, present options, do not auto-select

### Issue: Framework not compatible with requirements
**Solution:** Document incompatibility, suggest alternatives, adjust framework generation

### Issue: Dashboard performance is slow with large datasets
**Solution:** Implement data sampling, use reactive values for caching, suggest database integration, optimize reactive expressions.

### Issue: Reactive dependencies are causing performance issues
**Solution:** Use isolate() appropriately, implement debounce/throttle for frequent updates, optimize reactive expressions, consider using reactiveVal.

### Issue: Layout breaks on different screen sizes
**Solution:** Use responsive design frameworks, test on multiple devices, implement proper fluid layouts, use Bootstrap grid system.

### Issue: Complex filtering logic is difficult to implement
**Solution:** Break down complex filters into simpler reactive expressions, use helper functions, provide clear examples, document filtering logic.

### Issue: Visualizations are not rendering correctly
**Solution:** Check data format and structure, verify ggplot2 syntax, ensure required packages are loaded, provide error handling and user feedback.

## Quality Assurance

### Pre-Execution Checks
- Verify dashboard requirements are complete and valid
- Confirm output directory exists and is writable
- Validate that specified datasets are accessible
- Check that required R packages are available
- Ensure styling framework is supported
- Verify dashboard_requirements is accessible
- Confirm frontend_technology and backend_technology are provided
- Ensure access to technology trends intelligence
  
### Post-Execution Validation
- Verify all expected files were generated
- Check that generated code has proper syntax
- Validate that UI and server components are properly connected
- Confirm that example data is included and usable
- Ensure documentation is comprehensive and accurate
- Test that dashboard can be launched successfully
- Verify technology_stack is confirmed with user
- Confirm technology_trends_intelligence was called
- Ensure framework is compatible with specified technology stack
- Verify report includes all required sections
- Verify transparency about technology used
  
### Documentation Requirements
- Maintain clear file naming conventions
- Include setup instructions in README
- Document all dependencies and package requirements
- Provide examples of how to extend and customize the dashboard
- Include troubleshooting guidance for common issues
- Ensure code comments are clear and helpful
- Document technology stack confirmation process
- Preserve all technology trends intelligence
- Maintain clear audit trail
- Generate comprehensive report
- Ensure complete transparency


