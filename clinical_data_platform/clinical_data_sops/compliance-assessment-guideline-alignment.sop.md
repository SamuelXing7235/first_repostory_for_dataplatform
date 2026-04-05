# Compliance Assessment and Guideline Alignment Workflow

## Overview
This SOP guides the comprehensive compliance assessment of clinical trial documents, analyses, and methodologies with the latest regulatory guidelines, technical standards, and statistical methodology standards. It performs multi-dimensional compliance assessment including regulatory compliance, technical compliance, and methodology compliance. It ensures complete transparency about compliance status, identifies gaps, and provides actionable recommendations with mandatory user confirmation of assessment criteria and versions used.

## Parameters
- **assessment_target** (required): Target of compliance assessment
  - Examples: "clinical_trial_document", "analysis_dataset", "statistical_analysis", "system_architecture", "full_study_package"
  
- **target_content** (required): Content to be assessed
  - Examples: file paths, document content, analysis results, system specifications

- **guideline_type** (optional): Type of guideline or standard
  - Examples: "ICH E9", "CDISC SDTMIG", "FDA Guidance"
  
- **guideline_version** (required): Specific guideline version
  - Must be provided by user, cannot be auto-selected
  - If not provided, must call regulatory_guidelines_intelligence first
  
- **regulatory_agency** (required): Target regulatory agency
  - Examples: "FDA", "EMA", "PMDA", "NMPA"
  
- **assessment_scope** (optional): Scope of assessment
  - Examples: "full", "regulatory_only", "technical_only", "methodology_only"
  
- **assessment_date** (optional, default: current date): Date of assessment

**Constraints for parameter acquisition:**
- If all required parameters are already provided, You MUST proceed to the Steps
- If any required parameters are missing, You MUST ask for them before proceeding
- When asking for parameters, You MUST request all parameters in a single prompt
- When asking for parameters, You MUST use the exact parameter names as defined
- **CRITICAL**: guideline_version MUST be provided by user, cannot be auto-selected

## Steps

### 1. Assessment Parameter Validation
Validate all input parameters.

**Constraints:**
- You MUST validate assessment_target is supported
- You MUST validate target_content is accessible
- You MUST validate guideline_version is provided
- You MUST validate regulatory_agency is supported
- You MUST NOT proceed without required parameters
- You MUST document any validation issues
- **CRITICAL**: You MUST NOT proceed if guideline_version is not provided

### 2. Guideline Version Confirmation
Confirm guideline version with user.

**Constraints:**
- You MUST confirm guideline_version is specified by user
- You MUST NOT auto-select any version
- You MUST document version confirmation
- You MUST provide version information and constraints
- You MUST ensure transparency about version used
- **CRITICAL**: You MUST obtain explicit user confirmation of version

### 3. Regulatory Compliance Assessment
Assess compliance with regulatory guidelines.

**Constraints:**
- You MUST assess compliance with specified guideline version
- You MUST assess all relevant sections
- You MUST document evidence for compliance assessment
- You MUST identify any non-compliance
- You MUST provide specific findings
- You MUST document all assessment criteria

### 4. Technical Compliance Assessment
Assess technical compliance with standards.

**Constraints:**
- You MUST assess compliance with technical standards
- You MUST validate data structure and format
- You MUST check validation rules
- You MUST identify any technical non-compliance
- You MUST provide specific findings
- You MUST document all validation results

### 5. Methodology Compliance Assessment
Assess methodology compliance with standards.

**Constraints:**
- You MUST assess statistical methods compliance
- You MUST assess trial design compliance
- You MUST assess analysis plan compliance
- You MUST identify any methodology non-compliance
- You MUST provide specific findings
- You MUST document all methodology assessments

### 6. Gap Analysis and Risk Assessment
Identify gaps and assess risks.

**Constraints:**
- You MUST identify all compliance gaps
- You MUST assess severity of each gap
- You MUST assess impact of each gap
- You MUST assess regulatory implications
- You MUST prioritize gaps by importance
- You MUST document root cause analysis

### 7. Recommendation Generation
Generate compliance improvement recommendations.

**Constraints:**
- You MUST provide specific recommendations for each gap
- You MUST prioritize recommendations
- You MUST estimate effort and timeline
- You MUST identify required resources
- You MUST provide validation strategies
- You MUST ensure recommendations are actionable

### 8. Regulatory Submission Readiness Assessment
Assess readiness for regulatory submission.

**Constraints:**
- You MUST assess overall submission readiness
- You MUST assess readiness by agency
- You MUST identify critical path items
- You MUST provide timeline recommendations
- You MUST ensure realistic assessment
- You MUST document readiness criteria

### 9. Comprehensive Report Generation
Generate comprehensive compliance assessment report.

**Constraints:**
- You MUST generate comprehensive report
- You MUST include all assessment dimensions
- YOU MUST include all identified gaps
- YOU MUST include all recommendations
- YOU MUST include version information
- YOU MUST ensure complete transparency
- YOU MUST document all assumptions and limitations
- **CRITICAL**: You MUST clearly state the guideline version used

## Examples

### Full Compliance Assessment
**Input:**

```json
{
"assessment_target": "clinical_trial_document",
"target_content": "/documents/study_protocol.pdf",
"guideline_type": "ICH E9",
"guideline_version": "1998",
"regulatory_agency": "FDA",
"assessment_scope": "full"
}
```

**Output:** Comprehensive report including:
- Guideline version confirmation (ICH E9 1998)
- Regulatory compliance assessment (ICH E9, ICH E8, FDA Guidance)
- Technical compliance assessment (CDISC SDTMIG 3.3, ADaMIG 1.1)
- Methodology compliance assessment (statistical methods, multiplicity, missing data)
- Identified gaps with severity and impact
- Compliance improvement recommendations
- Regulatory submission readiness assessment
- Version upgrade recommendations

### CDISC Compliance Assessment
**Input:**

```json
{
"assessment_target": "analysis_dataset",
"target_content": "/data/adam/",
"guideline_type": "CDISC SDTMIG",
"guideline_version": "3.3",
"regulatory_agency": "FDA",
"assessment_scope": "technical_only"
}
```


**Output:** Comprehensive report including:
- Guideline version confirmation (SDTMIG 3.3)
- Technical compliance assessment (DM, AE, LB, VS domains)
- Validation results
- Identified gaps with severity
- Compliance improvement recommendations
- Regulatory submission readiness

## Troubleshooting

### Issue: Guideline version not provided
**Solution:** Request user to provide version, do not auto-select, explain importance, document requirement

### Issue: Target content not accessible
**Solution:** Document unavailability, request alternative content, provide partial assessment, document limitations

### Issue: Compliance criteria unclear
**Solution:** Document uncertainty, request clarification, provide best available assessment, note assumptions

### Issue: Multiple guideline versions applicable
**Solution:** Document all applicable versions, request user to specify, assess against specified version, note other versions

### Issue: Gap severity assessment uncertain
**Solution:** Document uncertainty, provide conservative assessment, recommend expert review, note assumptions

## Quality Assurance

### Pre-Execution Checks
- Verify assessment_target is supported
- Confirm target_content is accessible
- Validate guideline_version is provided
- Confirm regulatory_agency is supported
- Ensure access to guideline and standard information
- **CRITICAL**: Confirm user has explicitly specified guideline version

### Post-Execution Validation
- Verify assessment is based on user-specified version
- Confirm all compliance dimensions are assessed
- Validate all gaps are identified and prioritized
- Check that recommendations are specific and actionable
- Ensure report is comprehensive and transparent
- Verify all assumptions and limitations are documented
- **CRITICAL**: Verify guideline version is clearly stated in report

### Documentation Requirements
- Document all assessment criteria
- Preserve all evidence for compliance findings
- Maintain clear audit trail of assessment
- Generate comprehensive report
- Document all assumptions and limitations
- Ensure complete transparency
- Preserve version confirmation records
- **CRITICAL**: Document user confirmation of guideline version

