# SAP Compliance and Statistical Validation Workflow

## Overview
This SOP guides comprehensive validation that statistical analyses are conducted in strict compliance with the Statistical Analysis Plan (SAP). It ensures analysis correctness, identifies deviations, validates statistical methods, and maintains statistical integrity for regulatory submissions.  This SOP guides the comprehensive validation of Statistical Analysis Plans (SAPs) for regulatory compliance and statistical validity. It requires mandatory confirmation of guideline version and incorporates regulatory, methodological, and technical compliance assessment.



## Parameters
- **sap_document** (required): Statistical Analysis Plan document
  - File path or content of the SAP
  
- **guideline_version** (required): Regulatory guideline version
  - Must be specified by user
  - Examples: "ICH E9 1998", "ICH E9(R1) 2019"
  - If not provided, must call regulatory_guidelines_intelligence first
  
- **regulatory_agency** (required): Target regulatory agency
  - Examples: "FDA", "EMA", "PMDA", "NMPA"

- **validation_scope** (optional): Scope of validation
  - Examples: "full", "methodology_only", "technical_only"
  
- **analysis_results_path** (required): Path to analysis results (TFLs, model outputs, logs)
- **dataset_path** (required): Path to analysis datasets (ADaM datasets)
- **protocol_path** (optional): Path to Protocol document for context
- **define_xml_path** (optional): Path to Define-XML for variable verification
- **compliance_level** (optional, default: "standard"): Level of compliance checking ("strict", "standard", "lenient")
- **focus_areas** (optional): Array of specific areas to focus on
- **include_recommendations** (optional, default: true): Whether to include resolution recommendations

**Constraints for parameter acquisition:**
- If all required parameters are already provided, You MUST proceed to the Steps
- If any required parameters are missing, You MUST ask for them before proceeding
- When asking for parameters, You MUST request all parameters in a single prompt
- When asking for parameters, You MUST use the exact parameter names as defined
- **CRITICAL**: guideline_version MUST be provided by user, cannot be auto-selected
  
## Steps

### 0. Pre-Validation: Guideline Version Confirmation (NEW)
Confirm guideline version with user before proceeding.

**Constraints:**
- You MUST confirm guideline_version is specified by user
- If guideline_version is not provided:
  - You MUST call `regulatory_guidelines_intelligence` with:
    - guideline_type: "ICH E9"
    - regulatory_agency: [user-specified agency]
    - time_point: "current"
  - You MUST present available versions to user
  - You MUST request user to specify version
  - You MUST NOT auto-select any version
- You MUST document version confirmation
- You MUST ensure transparency about version used

### 1. Regulatory Guidelines Retrieval (NEW)
Retrieve latest regulatory guidelines for SAP validation.

**Constraints:**
- You MUST call `regulatory_guidelines_intelligence` with:
  - guideline_type: "ICH E9"
  - guideline_version: [user-specified version]
  - regulatory_agency: [user-specified agency]
- You MUST retrieve regulatory requirements for SAP
- You MUST identify any recent updates or changes
- You MUST document regulatory considerations

### 2. Statistical Methodology Intelligence (NEW)
Retrieve latest statistical methodology for validation context.

**Constraints:**
- You MUST call `statistical_methodology_intelligence` with:
  - methodology_domain: "statistical_methods"
  - application_context: "regulatory_submission"
  - regulatory_agency: [user-specified agency]
- You MUST retrieve latest methodology developments
- You MUST assess regulatory acceptance of methodologies in SAP
- You MUST identify best practices for SAP validation

### 3. SAP Document Analysis and Specification Extraction
Analyze SAP and extract detailed analysis specifications.

**Constraints:**
- You MUST call `doc_understand_structured` skill to parse SAP
- You MUST extract all analysis specifications systematically
- You MUST identify analysis populations and definitions
- You MUST extract primary and secondary endpoint specifications
- You MUST document statistical methods and models
- You MUST extract multiplicity adjustment procedures
- You MUST identify planned sensitivity analyses
- You MUST maintain traceability to SAP sections
- You MUST NOT skip any SAP sections
- You MUST validate statistical methods
- You MUST validate analysis plans
- You MUST validate multiplicity control
- You MUST validate missing data handling
- You MUST validate estimands (if applicable)

### 4. Analysis Population Validation
Verify analysis population definitions and applications.

**Constraints:**
- You MUST validate each analysis population definition matches SAP
- You MUST verify population flag derivation logic is correct
- You MUST check subject counts match SAP expectations
- You SHOULD verify population application across analyses
- You MUST identify any population definition deviations
- You MUST document population inclusion/exclusion criteria
- YOU SHOULD cross-check population consistency across datasets
- YOU MUST verify population flags are correctly assigned

### 5. Primary Endpoint Analysis Validation
Comprehensively validate primary endpoint analysis.

**Constraints:**
- You MUST verify statistical method matches SAP specification exactly
- You MUST validate model specifications (factors, covariates, interactions)
- You MUST verify analysis population is correct
- You MUST check statistical calculations are accurate
- You MUST verify p-values and effect estimates are correct
- You MUST validate confidence intervals are appropriate
- YOU SHOULD verify model diagnostics are conducted
- YOU MUST identify any deviations from SAP
- YOU MUST assess impact of any deviations

### 6. Secondary Endpoint Analysis Validation
Validate all secondary endpoint analyses.

**Constraints:**
- You MUST verify all planned secondary analyses are conducted
- You MUST validate statistical methods match SAP specifications
- You MUST verify hierarchical testing procedures are followed
- You MUST check multiplicity adjustments are correct
- YOU SHOULD verify alpha allocation is appropriate
- YOU MUST assess consistency across secondary analyses
- YOU MUST identify any missing or incorrect analyses
- YOU MUST document any deviations

### 7. Safety Analysis Validation
Validate safety analyses and population.

**Constraints:**
- You MUST verify safety population definition matches SAP
- You MUST validate all planned safety analyses are conducted
- You MUST check adverse event summaries are correct
- YOU SHOULD verify laboratory and vital signs analyses
- YOU MUST verify safety statistical methods are appropriate
- YOU SHOULD assess safety signal detection methods
- YOU MUST identify any safety analysis deviations
- YOU MUST assess safety data completeness

### 8. Statistical Method Application Validation
Verify statistical methods are applied correctly.

**Constraints:**
- You MUST verify statistical test procedures match SAP
- You MUST validate model specifications are correct
- YOU SHOULD verify software implementation is correct
- YOU MUST check procedure options match SAP
- YOU SHOULD verify statistical assumptions are addressed
- YOU MUST validate model diagnostics are conducted
- YOU SHOULD assess appropriateness of methods for data
- YOU MUST identify any methodological deviations

### 9. Multiplicity and Alpha Control Validation
Verify multiplicity handling and alpha control.

**Constraints:**
- You MUST identify all multiple comparisons
- You MUST verify adjustment methods match SAP
- You MUST check family-wise error rate is controlled
- YOU SHOULD verify alpha allocation is appropriate
- YOU MUST validate hierarchical testing procedures
- YOU SHOULD verify alpha spending if group sequential
- YOU MUST identify any multiplicity issues
- YOU MUST assess impact on Type I error rate

### 10. Missing Data Handling Validation
Verify missing data handling matches SAP.

**Constraints:**
- You MUST verify primary analysis handles missing data as specified
- You MUST validate missing data mechanism is assessed
- YOU SHOULD verify imputation methods if used
- YOU MUST check sensitivity analyses for missing data are conducted
- YOU SHOULD verify missing data patterns are documented
- YOU MUST assess impact of missing data on conclusions
- YOU MUST identify any deviations from SAP missing data plan

### 11. Sensitivity Analysis Validation
Validate planned and identify needed sensitivity analyses.

**Constraints:**
- You MUST verify all planned sensitivity analyses are conducted
- You MUST validate methods match SAP specifications
- YOU SHOULD assess impact of sensitivity analyses on conclusions
- YOU MUST identify additional sensitivity analyses needed
- YOU SHOULD verify robustness of primary conclusions
- YOU MUST document any missing sensitivity analyses
- YOU SHOULD recommend additional analyses if needed

### 12. TFL Compliance Verification
Verify TFLs match SAP specifications.

**Constraints:**
- You MUST verify all planned TFLs are produced
- You MUST validate TFL layouts match SAP shells
- YOU SHOULD verify display formats are correct
- YOU MUST verify statistical summaries are appropriate
- YOU SHOULD check consistency across related TFLs
- YOU MUST identify any missing or incorrect TFLs
- YOU MUST verify TFL content accuracy
- YOU SHOULD assess TFL presentation quality

### 13. Deviation Identification and Impact Assessment
Identify all deviations from SAP and assess their impact.

**Constraints:**
- You MUST identify all deviations from SAP specifications
- You MUST categorize deviations by severity (critical, major, minor)
- You MUST assess impact on primary conclusions
- YOU SHOULD assess regulatory compliance implications
- YOU MUST document rationale for each deviation
- YOU MUST identify deviations requiring protocol amendments
- YOU SHOULD provide recommendations for resolution
- YOU MUST assess overall impact on study validity

### 14. Comprehensive Compliance Assessment (NEW)
Assess overall compliance of SAP with guidelines.

**Constraints:**
- You MUST call `compliance_assessment_guideline_alignment` with:
  - assessment_target: "clinical_trial_document"
  - target_content: [sap_document]
  - guideline_type: "ICH E9"
  - guideline_version: [user-specified version]
  - regulatory_agency: [user-specified agency]
  - assessment_scope: "full"
- You MUST assess regulatory, technical, and methodology compliance
- You MUST identify any compliance gaps
- You MUST provide remediation recommendations
- You MUST assess regulatory submission readiness

### 15. User Interaction Preparation
Prepare user interaction for confirmation.

**Constraints:**
- You MUST prepare clear interaction prompt
- You MUST provide complete validation results
- You MUST ask relevant clarifying questions
- You MUST ensure transparency

### 16. Comprehensive Compliance Report Generation
Generate comprehensive SAP compliance report with actionable recommendations.

**Constraints:**
- You MUST include all regulatory considerations
- You MUST include methodology assessment
- You MUST include compliance assessment
- You MUST include submission readiness assessment
- You MUST include user interaction prompt
- You MUST ensure complete transparency
- You MUST generate comprehensive compliance report
- You MUST include assessment of all analysis areas
- You MUST document all deviations with impact assessment
- You MUST provide actionable recommendations prioritized by importance
- YOU SHOULD assess regulatory compliance and submission readiness
- YOU MUST include summary statistics and compliance metrics
- YOU SHOULD provide clear executive summary
- YOU MUST ensure report is comprehensive and actionable

## Examples

### Full Study SAP Compliance Validation
**Input:**

```json
{
"sap_path": "/documents/study_sap_v2.0.docx",
"analysis_results_path": "/outputs/final/",
"dataset_path": "/data/adam/",
"protocol_path": "/documents/study_protocol.pdf",
"guideline_version": "ICH E9 1998",
"regulatory_agency": "FDA",
"validation_scope": "full",
"define_xml_path": "/metadata/define.xml",
"compliance_level": "standard"
}
```


**Output:** Comprehensive SAP compliance report including:
- Regulatory considerations based on ICH E9 1998
- Methodology assessment
- Comprehensive compliance assessment
- Submission readiness assessment
- User interaction prompt for confirmation
- Analysis population validation (all populations compliant)
- Primary endpoint analysis validation (fully compliant)
- Secondary endpoint analysis validation (8/8 analyses compliant)
- Safety analysis validation (all safety analyses compliant)
- Statistical method validation (all methods appropriate)
- Multiplicity control validation (hierarchical testing correct)
- Missing data handling validation (MMRM correctly implemented)
- TFL compliance verification (32/32 TFLs produced)
- Deviation identification (1 minor deviation identified)
- Regulatory compliance assessment (ready for submission)
- Actionable recommendations for minor improvements

### Focused Primary Endpoint Validation
**Input:**

```json
{
"sap_path": "/documents/study_sap.docx",
"analysis_results_path": "/outputs/primary/",
"dataset_path": "/data/adam/",
"focus_areas": ["primary", "populations"],
"compliance_level": "strict"
}
```


**Output:** Focused validation report including:
- Primary endpoint analysis detailed validation
- Analysis population validation
- Statistical method verification
- Calculation accuracy verification
- Deviation identification (none identified)
- Compliance assessment (fully compliant)
- Recommendations for documentation enhancement

## Troubleshooting

### Issue: Guideline version not provided
**Solution:** Request user to provide version, call regulatory_guidelines_intelligence, present options, do not auto-select

### Issue: SAP not compliant with guidelines
**Solution:** Document all non-compliance issues, provide specific remediation recommendations, suggest SAP revisions

### Issue: SAP specifications are ambiguous or unclear
**Solution:** Document ambiguity, seek clarification, make reasonable assumptions, document rationale, note uncertainty in report.

### Issue: Analysis results don't match SAP specifications
**Solution:** Identify deviation, assess impact, determine if protocol amendment needed, document thoroughly, provide recommendations.

### Issue: Missing planned analyses
**Solution:** Identify missing analyses, assess impact on conclusions, recommend completion if critical, document gap.

### Issue: Inconsistent results across related analyses
**Solution:** Investigate source of inconsistency, verify data and methods, recommend resolution, assess impact on conclusions.

### Issue: Deviation from SAP but methodologically sound
**Solution:** Document deviation, provide rationale, assess regulatory implications, recommend documentation, determine if amendment needed.

### Issue: Population definitions don't match SAP
**Solution:** Identify specific differences, assess impact on analyses, recommend correction if critical, document deviation.

### Issue: Statistical method not implemented as specified
**Solution:** Identify methodological deviation, assess impact on results, recommend correction or justification, document thoroughly.

## Quality Assurance

### Pre-Execution Checks
- Verify sap_document is accessible
- Confirm guideline_version is provided
- Confirm regulatory_agency is supported
- Ensure access to regulatory guidelines, methodology intelligence, and compliance assessment
- Verify SAP document is accessible and readable
- Confirm analysis results are complete and available
- Validate that analysis datasets are accessible
- Check that protocol is available if needed
- Ensure Define-XML is available for variable verification
- Confirm compliance level is specified

### Post-Execution Validation
- Verify guideline_version is confirmed with user
- Confirm regulatory_guidelines_intelligence was called
- Confirm statistical_methodology_intelligence was called
- Confirm compliance_assessment_guideline_alignment was called
- Ensure validation aligns with specified guideline version
- Verify report includes all required sections
- Verify transparency about version used
- Verify all planned analyses were validated
- Confirm all deviations were identified and assessed
- Validate that recommendations are specific and actionable
- Check that regulatory compliance was assessed
- Ensure report is comprehensive and well-structured
- Verify traceability to SAP sections is maintained
- Confirm all severity classifications are appropriate

### Documentation Requirements
- Document version confirmation process
- Preserve all regulatory and methodology intelligence
- Preserve comprehensive compliance assessment results
- Maintain clear audit trail
- Generate comprehensive report
- Ensure complete transparency
- Maintain clear audit trail of validation process
- Document all SAP specifications extracted
- Preserve references to SAP sections
- Generate comprehensive compliance report
- Provide clear recommendations with priorities
- Ensure all deviations are thoroughly documented
- Maintain objectivity and scientific rigor
- Document all assumptions and limitations
- Preserve source references for all findings
