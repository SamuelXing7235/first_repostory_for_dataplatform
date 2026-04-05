# CDISC Validation Rule Application Workflow

## Overview
This SOP guides the comprehensive CDISC compliance validation process for clinical trial datasets. It integrates with standard validation tools like Pinnacle 21, executes validation checks, parses validation reports, categorizes issues by severity and type, and provides actionable resolution suggestions, ensuring data submission readiness and regulatory compliance. This SOP guides the application of CDISC validation rules to clinical trial datasets, ensuring compliance with latest regulatory guidelines and standards. It requires mandatory confirmation of CDISC standard version and incorporates compliance assessment.

## Parameters
- **dataset_path** (required): Path to CDISC datasets
  - File path or directory containing CDISC datasets
  
- **cdisc_standard_version** (required): CDISC standard version
  - Must be specified by user
  - Examples:
    - {"standard": "SDTMIG", "version": "3.3"}
    - {"standard": "ADaMIG", "version": "1.1"}
  - If not provided, must call regulatory_guidelines_intelligence first
  
- **regulatory_agency** (required): Target regulatory agency
  - Examples: "FDA", "EMA", "PMDA", "NMPA"

- **validation_level** (optional): Validation level
  - Examples: "basic", "standard", "comprehensive"
  
- **define_xml_path** (required): Path to Define-XML file
- **cdisc_standard** (required): CDISC standard version (e.g., "SDTMIG 3.3", "ADaMIG 1.1")
- **validation_tool** (optional, default: "pinnacle21"): Validation tool to use ("pinnacle21", "opensource", "custom")
- **custom_rules** (optional): Path to custom validation rules file
- **output_format** (optional, default: "JSON"): Output format for reports ("JSON", "Excel", "HTML", "PDF")
- **include_suggestions** (optional, default: true): Whether to include resolution suggestions
- **severity_filter** (optional): Filter issues by minimum severity level

**Constraints for parameter acquisition:**
- If all required parameters are already provided, You MUST proceed to the Steps
- If any required parameters are missing, You MUST ask for them before proceeding
- When asking for parameters, You MUST request all parameters in a single prompt
- When asking for parameters, You MUST use the exact parameter names as defined
- **CRITICAL**: cdisc_standard_version MUST be provided by user, cannot be auto-selected
  
## Steps

### 0. Pre-Validation: CDISC Standard Version Confirmation (NEW)
Confirm CDISC standard version with user before proceeding.

**Constraints:**
- You MUST confirm cdisc_standard_version is specified by user
- If cdisc_standard_version is not provided:
  - You MUST call `regulatory_guidelines_intelligence` with:
    - guideline_type: "CDISC SDTMIG"
    - regulatory_agency: [user-specified agency]
    - time_point: "current"
  - You MUST present available CDISC versions to user
  - You MUST request user to specify version
  - You MUST NOT auto-select any version
- You MUST document version confirmation
- You MUST ensure transparency about version used

### 1. Regulatory Guidelines Retrieval (NEW)
Retrieve latest CDISC validation rules and requirements.

**Constraints:**
- You MUST call `regulatory_guidelines_intelligence` with:
  - guideline_type: "CDISC SDTMIG" (or ADaMIG)
  - guideline_version: [user-specified version]
  - regulatory_agency: [user-specified agency]
- You MUST retrieve CDISC validation rules
- You MUST identify any recent updates or changes
- You MUST document regulatory considerations
  
### 2. Validation Environment Setup
Prepare and validate the validation environment before execution.

**Constraints:**
- You MUST verify validation tool installation and configuration
- You MUST check CDISC standard version compatibility
- You MUST configure validation rules and parameters
- You MUST set up output directories and file paths
- You MUST validate input dataset accessibility
- You SHOULD verify system resources are sufficient
- You MUST NOT proceed if environment is not properly configured

### 3. Validation Task Execution
Execute validation tool with appropriate parameters and monitor execution.

**Constraints:**
- You MUST apply validation rules according to specified CDISC standard
- You MUST validate all required domains
- You MUST check all required variables
- You MUST identify errors and warnings
- You MUST construct validation command with appropriate parameters:
  - Data directory path
  - Define-XML file path
  - CDISC standard version
  - Validation rule set
  - Output format and location
- You MUST execute validation tool through command line or API
- You MUST monitor validation task execution status
- You MUST handle execution errors and exceptions appropriately
- You MUST retrieve generated validation report
- You SHOULD document execution parameters and results
- You MUST not proceed if validation fails to execute

### 4. Compliance Assessment (NEW)
Assess overall compliance of datasets.

**Constraints:**
- You MUST call `compliance_assessment_guideline_alignment` with:
  - assessment_target: "analysis_dataset"
  - target_content: [dataset_path]
  - guideline_type: "CDISC SDTMIG" (or ADaMIG)
  - guideline_version: [user-specified version]
  - regulatory_agency: [user-specified agency]
  - assessment_scope: "technical_only"
- You MUST assess technical compliance
- You MUST identify any compliance gaps
- You MUST provide remediation recommendations
  
### 5. User Interaction Preparation
Prepare user interaction for confirmation.

**Constraints:**
- You MUST prepare clear interaction prompt
- You MUST provide complete validation results
- You MUST ask relevant clarifying questions
- You MUST ensure transparency

### 6. Comprehensive Report Generation
Generate comprehensive validation report.

**Constraints:**
- You MUST include all validation results
- You MUST include compliance assessment
- You MUST include remediation recommendations
- You MUST include user interaction prompt
- You MUST ensure complete transparency
  
### 7. Validation Report Parsing
Parse validation report and extract individual issues with full context.

**Constraints:**
- You MUST load validation report file (Excel, XML, or JSON)
- You MUST parse report structure and extract individual issues
- You MUST extract issue metadata:
  - Rule ID and description
  - Severity level
  - Affected dataset and variable
  - Record counts and locations
  - Error messages and context
- You MUST convert parsed data into structured format
- You MUST preserve source references and traceability
- You SHOULD handle multiple report formats appropriately
- You MUST not skip any issues; you MUST extract all systematically

### 8. Issue Categorization and Analysis
Classify issues by severity and type, and assess potential impact.

**Constraints:**

#### Severity Classification
- You MUST classify issues by severity:
  - **Critical**: Errors preventing submission or analysis
  - **Major**: Significant issues affecting data quality
  - **Minor**: Issues that should be addressed
  - **Warning**: Informational items
- You MUST provide rationale for severity classifications
- You SHOULD consider regulatory implications

#### Type Classification
- You MUST categorize issues by type:
  - **Structural**: Dataset organization issues
  - **Variable**: Variable definition issues
  - **Value**: Data value issues
  - **Relationship**: Referential integrity issues
  - **Terminology**: Controlled terminology issues
- You MUST document classification criteria

#### Risk Assessment
- You MUST assess potential impact on submission and analysis
- You MUST prioritize issues based on severity and impact
- You SHOULD consider dependencies between issues
- You MUST document risk assessment rationale

### 5. Solution Recommendation Generation
Provide actionable resolution suggestions for identified issues.

**Constraints:**
- You MUST match issues against knowledge base of common problems
- You MUST generate automated suggestions for well-known issues:
  - Date format corrections
  - Missing required variables
  - Controlled terminology errors
  - Variable length violations
  - Referential integrity issues
- You MUST provide code examples for common fixes
- You MUST reference relevant CDISC implementation guides
- You MUST offer best practice recommendations
- You MUST flag complex issues requiring expert review
- You SHOULD provide multiple resolution options when applicable
- You MUST ensure suggestions are specific and actionable

### 6. Report Generation
Generate comprehensive validation reports with actionable information.

**Constraints:**
- You MUST generate executive summary with key metrics:
  - Total issue count by severity
  - Issue breakdown by type
  - Compliance score
  - Datasets with issues
- You MUST create detailed issue reports with:
  - Full issue descriptions
  - Source locations and context
  - Impact assessments
  - Resolution suggestions
- You MUST produce issue tracking tables:
  - CSV format for spreadsheet import
  - Jira import format for issue tracking
  - Include assignment and status fields
- You MUST generate visual representations:
  - Issue distribution charts
  - Severity breakdown graphs
  - Dataset comparison charts
- You MUST create downloadable reports in multiple formats
- You SHOULD include trend analysis if historical data available
- You MUST ensure reports are comprehensive yet readable

## Examples

### Basic SDTM Validation
**Input:**

```json
{
"data_dir": "/data/study001/sdtm/",
"define_xml_path": "/data/study001/define.xml",
"cdisc_standard_version": {
"standard": "SDTMIG",
"version": "3.3"
},
"regulatory_agency": "FDA",
"validation_tool": "pinnacle21",
"output_format": "HTML",
"include_suggestions": true
}
```


**Output:** Comprehensive validation report including:
- Validation results based on SDTMIG 3.3
- Compliance assessment
- Remediation recommendations
- User interaction prompt for confirmation
- Executive summary with 47 total issues (3 critical, 12 major, 18 minor, 14 warnings)
- Detailed issue reports with severity classifications and resolution suggestions
- Issue tracking table in CSV format for import into issue tracking system
- Visual charts showing issue distribution by type and severity
- Code examples for common fixes
- Compliance score of 78%

### Comprehensive SDTM and ADaM Validation with Custom Rules
**Input:**

```json
{
"data_dir": "/data/oncology001/",
"define_xml_path": "/data/oncology001/define.xml",
"cdisc_standard": "SDTMIG 3.3, ADaMIG 1.1",
"validation_tool": "pinnacle21",
"custom_rules": "/validation_rules/oncology_custom_rules.xml",
"output_format": "JSON",
"severity_filter": "major",
"include_suggestions": true
}
```


**Output:** Advanced validation package including:
- JSON-formatted validation results with structured issue data
- Application of both standard CDISC rules and custom oncology-specific rules
- Filtered results showing only major and critical issues
- Detailed resolution suggestions with code examples
- Integration-ready issue tracking data
- Compliance assessment against both SDTMIG 3.3 and ADaMIG 1.1
- Recommendations for addressing oncology-specific validation issues

## Troubleshooting

### Issue: CDISC standard version not provided
**Solution:** Request user to provide version, call regulatory_guidelines_intelligence, present options, do not auto-select

### Issue: Dataset validation fails
**Solution:** Document all errors and warnings, provide specific remediation steps, suggest data corrections

### Issue: Validation tool execution fails
**Solution:** Check tool installation, verify file paths, review error logs, try alternative validation methods, ensure proper configuration.

### Issue: Validation report cannot be parsed
**Solution:** Verify report format, check for file corruption, try alternative parsing methods, request manual review, document parsing limitations.

### Issue: Too many issues generated
**Solution:** Filter by severity, prioritize critical issues, group similar issues, provide summary statistics, create actionable issue tracking table.

### Issue: Solution suggestions are not applicable
**Solution:** Flag for expert review, provide general guidance, reference documentation, suggest consultation, document limitations.

### Issue: Validation takes too long
**Solution:** Optimize validation parameters, use incremental validation, parallelize validation tasks, suggest performance improvements, monitor resource usage.

### Issue: False positives in validation results
**Solution:** Document false positives, provide context for interpretation, suggest rule customization, recommend expert review, maintain false positive log.

## Quality Assurance

### Pre-Execution Checks
- Verify dataset_path is accessible
- Confirm cdisc_standard_version is provided
- Confirm regulatory_agency is supported
- Ensure access to regulatory guidelines intelligence and compliance assessment
- Verify validation tool is properly installed and configured
- Confirm all input datasets are accessible and readable
- Validate that Define-XML file exists and is well-formed
- Check that CDISC standard version is supported
- Ensure output directory exists and is writable
- Verify system resources are sufficient

### Post-Execution Validation
- Verify cdisc_standard_version is confirmed with user
- Confirm regulatory_guidelines_intelligence was called
- Confirm compliance_assessment_guideline_alignment was called
- Ensure validation rules align with specified CDISC standard
- Verify report includes all required sections
- Verify transparency about version used
- Verify validation report was generated successfully
- Confirm all issues were extracted and categorized
- Validate that severity classifications are appropriate
- Check that resolution suggestions are actionable
- Ensure reports are complete and accurate
- Verify issue tracking tables are properly formatted
- Confirm all visualizations render correctly

### Documentation Requirements
- Document version confirmation process
- Preserve all regulatory guidelines intelligence
- Preserve compliance assessment results
- Maintain clear audit trail
- Generate comprehensive report
- Ensure complete transparency
- Maintain clear audit trail of validation activities
- Document all validation parameters and configurations
- Preserve source references for all identified issues
- Generate comprehensive validation summary
- Provide clear guidance for issue resolution
- Track validation history and trends over time
- Document any limitations or assumptions
- Maintain knowledge base of common issues and solutions

## Regulatory Compliance

### CDISC Standards
- Follow CDISC SDTMIG and ADaMIG validation requirements
- Apply standard CDISC validation rules
- Ensure compliance with regulatory submission requirements
- Support FDA and EMA validation expectations

### GCP Considerations
- Ensure data integrity and validation requirements are met
- Support audit trail and documentation needs
- Facilitate reproducibility of validation results
- Enable quality control and issue tracking

### Best Practices
- Follow industry best practices for CDISC validation
- Implement systematic issue resolution processes
- Support database lock and submission preparation
- Enable continuous quality improvement
- Facilitate cross-study validation comparisons
- Maintain validation documentation for regulatory inspections
