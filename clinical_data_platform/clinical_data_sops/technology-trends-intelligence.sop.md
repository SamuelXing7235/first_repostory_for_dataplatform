# Technology Trends Intelligence Workflow

## Overview
This SOP guides the intelligent retrieval and management of the latest technology trends in programming languages, statistical programming libraries, code generation technologies, development tools, and system architectures. It provides version management, compatibility analysis, and technology selection recommendations to support informed technology stack decisions with mandatory user confirmation and complete transparency.

## Parameters
- **technology_domain** (required): Technology domain of interest
  - Examples: "programming_languages", "statistical_libraries", "code_generation", "development_tools", "system_architecture"
  
- **application_scenario** (required): Application scenario
  - Examples: "clinical_data_analysis", "regulatory_submission", "exploratory_analysis", "data_visualization", "system_development"

- **language** (optional): Specific programming language
  - Examples: "Python", "R", "SAS"
  
- **technology_name** (optional): Specific technology name
  - Examples: "pandas", "React", "Docker", "Shiny", "plotly"
  
- **version** (optional): Specific version number
  - If specified, returns detailed information about that version
  
- **include_deprecated** (optional, default: false): Whether to include deprecated technologies
  
- **include_comparison** (optional, default: true): Whether to include technology comparison
- **change_log** (optional, default: true): Whether to include version change
  
**Constraints for parameter acquisition:**
- If all required parameters are already provided, You MUST proceed to the Steps
- If any required parameters are missing, You MUST ask for them before proceeding
- When asking for parameters, You MUST request all parameters in a single prompt
- When asking for parameters, You MUST use the exact parameter names as defined
- **CRITICAL**: guideline_version MUST be provided by user, cannot be auto-selected

## Steps

### 1. Query Parameter Validation
Validate all input parameters.

**Constraints:**
- You MUST validate technology_domain is supported
- You MUST validate application_scenario is relevant
- You SHOULD validate language if provided
- You MUST NOT proceed with invalid parameters
- You MUST document any validation issues

### 2. Technology Information Retrieval
Retrieve technology information from official sources.

**Constraints:**
- You MUST retrieve information from official technology sources
- You MUST ensure information is up-to-date
- You SHOULD retrieve information from multiple sources
- You MUST document source and retrieval date
- You MUST NOT use outdated or unofficial sources
- You MUST verify information accuracy

### 3. Version Identification and Compatibility Analysis
Identify versions and analyze compatibility.

**Constraints:**
- You MUST identify all relevant versions
- You MUST analyze version compatibility
- You SHOULD identify dependency relationships
- You MUST identify deprecated versions
- You MUST identify EOL (End of Life) versions
- You MUST document compatibility matrix

### 4. Technology Maturity Assessment
Assess maturity and regulatory acceptance of technologies.

**Constraints:**
- You MUST assess technology maturity
- You MUST assess regulatory acceptance
- You SHOULD identify limitations and constraints
- You MUST provide realistic recommendations
- You MUST document assessment criteria
- You MUST consider clinical trial applicability

### 5. Application Scenario Analysis
Analyze technology suitability for specific scenarios.

**Constraints:**
- You MUST analyze suitability for specified scenario
- You MUST consider regulatory requirements
- YOU SHOULD consider team expertise
- YOU MUST consider existing systems
- YOU MUST provide scenario-specific recommendations
- YOU MUST identify implementation considerations

### 6. Technology Comparison and Evaluation
Compare different technologies and evaluate trade-offs.

**Constraints:**
- You MUST compare relevant technologies
- You MUST identify advantages and disadvantages
- YOU SHOULD assess learning curves
- YOU MUST consider integration requirements
- YOU SHOULD provide comparative analysis
- YOU MUST avoid bias in recommendations

### 7. Recommendation Generation
Generate technology recommendations based on analysis.

**Constraints:**
- You MUST provide scenario-specific recommendations
- You MUST provide rationale for recommendations
- YOU SHOULD consider multiple factors
- YOU MUST identify implementation considerations
- YOU MUST provide clear guidance
- YOU MUST NOT make automatic technology selection

### 8. User Interaction Preparation
Prepare user interaction for technology confirmation.

**Constraints:**
- You MUST prepare clear interaction prompt
- You MUST provide complete technology information
- YOU MUST provide multiple selection options
- YOU MUST ask relevant clarifying questions
- YOU MUST ensure transparency
- YOU MUST NOT make automatic technology selection

### 9. Comprehensive Report Generation
Generate comprehensive report with all findings.

**Constraints:**
- You MUST generate comprehensive report
- You MUST include all relevant technologies
- YOU MUST include version information
- YOU MUST include compatibility analysis
- YOU MUST include recommendations
- YOU MUST include user interaction prompt
- YOU MUST ensure complete transparency
- YOU MUST document all sources

## Examples

### Statistical Libraries Query
**Input:**
```json
{
"technology_domain": "statistical_libraries",
"application_scenario": "clinical_data_analysis",
"language": "Python",
"include_comparison": true
}
```


**Output:** Comprehensive report including:
- Python statistical libraries (pandas, numpy, statsmodels, scikit-learn, lifelines)
- Version information and compatibility
- Regulatory acceptance assessment
- Application scenario analysis
- Technology recommendations
- User interaction prompt for technology confirmation

### Development Tools Query
**Input:**

```json
{
"technology_domain": "development_tools",
"application_scenario": "regulatory_submission",
"include_comparison": true
}
```


**Output:** Comprehensive report including:
- Development environments (JupyterLab, RStudio, VS Code)
- Version control systems (Git)
- Containerization technologies (Docker)
- Regulatory acceptance considerations
- Recommendations for regulatory submission
- User interaction prompt for technology confirmation

## Troubleshooting

### Issue: Technology domain not supported
**Solution:** Document unsupported domain, suggest alternatives, request clarification from user

### Issue: Technology information not available
**Solution:** Document unavailability, suggest contacting vendor directly, provide partial information

### Issue: Conflicting information from sources
**Solution:** Document conflicts, identify most authoritative source, note uncertainty in report

### Issue: Technology not suitable for clinical trials
**Solution:** Document limitations, provide alternatives, explain regulatory considerations

### Issue: Version compatibility unclear
**Solution:** Document uncertainty, recommend testing, provide best available information

## Quality Assurance

### Pre-Execution Checks
- Verify technology_domain is supported
- Confirm application_scenario is relevant
- Validate language if provided
- Check version format if provided
- Ensure access to technology information sources

### Post-Execution Validation
- Verify information is from official sources
- Confirm information is current and accurate
- Validate all technologies are correctly identified
- Check that version information is accurate
- Ensure user interaction prompt is clear and complete
- Verify report is comprehensive and transparent

### Documentation Requirements
- Document all sources and retrieval dates
- Preserve all version information and compatibility data
- Maintain clear audit trail of analysis
- Generate comprehensive report
- Document all assumptions and limitations
- Ensure complete transparency
