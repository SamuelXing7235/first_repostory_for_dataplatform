# CDISC Dataset Design Workflow

## Overview
This SOP guides the design of CDISC-compliant clinical trial datasets. It bridges the gap between source data (CRF) and regulatory submission requirements by creating detailed dataset specifications for both SDTM and ADaM standards, ensuring data submission readiness and regulatory compliance. This SOP guides the design of CDISC-compliant datasets for clinical trials, ensuring alignment with latest regulatory guidelines and standards. It requires mandatory confirmation of CDISC standard version and incorporates compliance assessment.

## Parameters
- **study_design_document** (required): Study design document
  - File path or content of study design
  
- **cdisc_standard_version** (required): CDISC standard version
  - Must be specified by user
  - Examples:
    - {"standard": "SDTMIG", "version": "3.3"}
    - {"standard": "ADaMIG", "version": "1.1"}
  - If not provided, must call regulatory_guidelines_intelligence first
  
- **regulatory_agency** (required): Target regulatory agency
  - Examples: "FDA", "EMA", "PMDA", "NMPA"

- **domain_specific_requirements** (optional): Domain-specific requirements
  - Examples: {"domains": ["DM", "AE", "LB"], "special_variables": [...]}
  
- **acrf_path** (required): Path to Annotated CRF document
- **sap_path** (required): Path to Statistical Analysis Plan
- **design_target** (required): Target design type ("SDTM", "ADaM", or "BOTH")
- **protocol_path** (optional): Path to Protocol document for additional context
- **blank_crf_path** (optional): Path to blank CRF for reference
- **cdisc_version** (optional): CDISC standard version (e.g., "SDTMIG 3.3", "ADaMIG 1.1")
- **therapeutic_area** (optional): Therapeutic area for TAUG-specific requirements
- **output_format** (optional): Output format for specifications ("Excel", "CSV", "JSON")

**Constraints for parameter acquisition:**
- If all required parameters are already provided, You MUST proceed to the Steps
- If any required parameters are missing, You MUST ask for them before proceeding
- When asking for parameters, You MUST request all parameters in a single prompt
- When asking for parameters, You MUST use the exact parameter names as defined
- **CRITICAL**: cdisc_standard_version MUST be provided by user, cannot be auto-selected
  
## Steps

### 0. Pre-Design: CDISC Standard Version Confirmation (NEW)
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
Retrieve latest CDISC standards and regulatory requirements.

**Constraints:**
- You MUST call `regulatory_guidelines_intelligence` with:
  - guideline_type: "CDISC SDTMIG" (or ADaMIG)
  - guideline_version: [user-specified version]
  - regulatory_agency: [user-specified agency]
- You MUST retrieve CDISC standard requirements
- You MUST identify any recent updates or changes
- You MUST document regulatory considerations
- 
### 2. Document Analysis and Information Extraction
Extract and synthesize information from multiple input documents.

**Constraints:**
- You MUST call `doc_understand_structured` skill to parse input documents
- You MUST extract key information from Annotated CRF:
  - Form structure and field definitions
  - Variable names, labels, and data types
  - Data collection schedules and visits
- You MUST extract analysis requirements from SAP:
  - Analysis populations and subgroups
  - Primary and secondary endpoints
  - Statistical analysis methods
  - TFL specifications
- You MUST extract study design information from Protocol:
  - Study objectives and design
  - Treatment arms and randomization
  - Inclusion/exclusion criteria
  - Schedule of assessments
- You MUST synthesize requirements from all documents
- You MUST preserve source references for all extracted information
- You MUST NOT skip any document; you MUST process all systematically
- You MUST extract key study design elements
- You MUST identify required domains
- You MUST understand data collection points
- You MUST identify variable requirements
  
### 3. SDTM Domain Design
Identify and design required SDTM domains based on data collection.

**Constraints:**
- You MUST design domains according to specified CDISC standard
- You MUST ensure all required variables are included
- You MUST follow CDISC naming conventions
- You MUST consider regulatory requirements
- You MUST identify required SDTM domains based on data collection:
  - DM (Demographics) - always required
  - AE (Adverse Events) if safety data collected
  - LB (Laboratory) if lab tests performed
  - VS (Vital Signs) if vital signs measured
  - EX (Exposure) if treatment administration recorded
  - Other domains as needed (CM, DS, MH, etc.)
- For each domain, you MUST:
  - Design variable structure following SDTMIG specifications
  - Determine required and optional variables
  - Identify controlled terminology requirements
  - Create mapping specifications from CRF fields
  - Document derivation logic for calculated variables
- You MUST follow specified CDISC standard version
- You SHOULD consider therapeutic area-specific requirements (TAUGs)
- You MUST ensure all domains are properly designed

### 4. Compliance Assessment (NEW)
Assess compliance of designed datasets with CDISC standards.

**Constraints:**
- You MUST call `compliance_assessment_guideline_alignment` with:
  - assessment_target: "analysis_dataset"
  - target_content: [designed dataset specifications]
  - guideline_type: "CDISC SDTMIG" (or ADaMIG)
  - guideline_version: [user-specified version]
  - regulatory_agency: [user-specified agency]
  - assessment_scope: "technical_only"
- You MUST assess technical compliance
- You MUST identify any compliance gaps
- You MUST provide remediation recommendations
  
### 5. SDTM Mapping Specification Generation
Create detailed mapping specifications from source to target variables.

**Constraints:**
- You MUST create detailed mapping specifications for each domain:
  - Target SDTM domain and variable
  - Source CRF form and field
  - Data type and format conversions
  - Controlled terminology mapping
  - Derivation logic for calculated variables
- You MUST generate mapping tables in Excel or CSV format
- You MUST document complex mappings with detailed explanations
- You MUST identify unmapped CRF fields for review
- You SHOULD provide examples for complex transformations
- You MUST maintain clear traceability from source to target
- You MUST ensure all required variables have mapping specifications

### 6. ADaM Dataset Design
Design ADaM datasets based on SAP analysis requirements.

**Constraints:**
- You MUST analyze SAP to determine analysis requirements:
  - Identify all planned analyses and endpoints
  - Determine required analysis populations
  - Understand subgroup and stratification needs
- You MUST design ADSL dataset:
  - Include key demographic and baseline variables
  - Add treatment variables and flags
  - Create population flags (SAFFL, EFFL, PPFL, etc.)
  - Include study dates and durations
- You MUST design BDS datasets for major analyses:
  - Define parameters (PARAM, PARAMCD) for each endpoint
  - Specify analysis values (AVAL) and baseline values (BASE)
  - Derive change from baseline (CHG) variables
  - Include analysis flags and visit information
- You MUST design other ADaM datasets as needed:
  - ADTTE for time-to-event analyses
  - ADAE for safety analyses
  - OCCDS for special requirements
- You MUST follow ADaMIG specifications
- You SHOULD consider performance and analysis efficiency

### 7. Compliance Assessment (ADaM)
Assess compliance of designed datasets with CDISC,ADaM standards.

**Constraints:**
- You MUST call `compliance_assessment_guideline_alignment` with:
  - assessment_target: "analysis_dataset"
  - target_content: [designed dataset specifications]
  - guideline_type: "CDISC SDTMIG" (or ADaMIG)
  - guideline_version: [user-specified version]
  - regulatory_agency: [user-specified agency]
  - assessment_scope: "technical_only"
- You MUST assess technical compliance
- You MUST identify any compliance gaps
- You MUST provide remediation recommendations
  
### 8. ADaM Specification Generation
Generate detailed ADaM specifications with traceability.

**Constraints:**
- You MUST generate detailed ADaM specifications:
  - Dataset structure and purpose
  - Variable definitions and attributes
  - Derivation logic for all calculated variables
  - Source traceability to SDTM datasets
  - Analysis population definitions
- You MUST document parameter coding and categorization
- You MUST create variable derivation flowcharts
- You MUST identify complex derivations requiring special attention
- You SHOULD provide examples for complex derivations
- You MUST ensure all variables have clear source traceability
- You MUST follow ADaMIG standards and best practices

### 9. Quality and Compliance Review
Verify compliance with CDISC standards and identify potential issues.

**Constraints:**
- You MUST verify compliance with CDISC standards:
  - SDTMIG compliance for SDTM datasets
  - ADaMIG compliance for ADaM datasets
  - Therapeutic area user guide (TAUG) requirements
- You MUST assess traceability and documentation:
  - Ensure all variables have clear source traceability
  - Verify derivation logic is well-documented
  - Check that controlled terminology is correctly applied
- You MUST identify potential risks and issues:
  - Non-standard data types or mappings
  - Complex derivations that may be error-prone
  - Gaps between CRF collection and analysis needs
- You MUST generate compliance and risk assessment report
- You SHOULD provide recommendations for addressing identified issues
- You MUST document all assumptions and design decisions

### 10. User Interaction Preparation
Prepare user interaction for confirmation.

**Constraints:**
- You MUST prepare clear interaction prompt
- You MUST provide complete CDISC standard information
- You MUST ask relevant clarifying questions
- You MUST ensure transparency

### 11. Comprehensive Report Generation
Generate comprehensive dataset design report.

**Constraints:**
- You MUST include all regulatory considerations
- You MUST include dataset design
- You MUST include compliance assessment
- You MUST include user interaction prompt
- You MUST ensure complete transparency
  
## Examples

### Basic SDTM Design for Phase II Study
**Input:**

```json
{
"acrf_path": "/documents/study001_acrf.pdf",
"sap_path": "/documents/study001_sap.docx",
"design_target": "SDTM",
"protocol_path": "/documents/study001_protocol.pdf",
"therapeutic_area": "cardiology",
"study_design_document": "/design/study_123_design.pdf",
"cdisc_standard_version": {
"standard": "SDTMIG",
"version": "3.3"
},
"regulatory_agency": "FDA"
}
```

**Output:** Comprehensive SDTM design including:
- Regulatory considerations based on SDTMIG 3.3
- Dataset design specifications
- Compliance assessment results
- User interaction prompt for confirmation
- Mapping specifications in Excel format with source-to-target mappings
- Controlled terminology assignments
- Derivation logic for calculated variables
- Compliance assessment and risk report

### Comprehensive SDTM and ADaM Design for Oncology Study
**Input:**

```json
{
"acrf_path": "/documents/oncology001_acrf.pdf",
"sap_path": "/documents/oncology001_sap.docx",
"design_target": "BOTH",
"protocol_path": "/documents/oncology001_protocol.pdf",
"blank_crf_path": "/documents/oncology001_blank_crf.pdf",
"cdisc_version": "SDTMIG 3.3, ADaMIG 1.1",
"therapeutic_area": "oncology",
"output_format": "Excel"
}
```


**Output:** Complete CDISC design package including:
- SDTM domain design with mapping specifications
- ADaM dataset design (ADSL, ADLB, ADAE, ADTTE, ADRS)
- Detailed variable specifications and derivation logic
- Traceability documentation from CRF to SDTM to ADaM
- Therapeutic area-specific considerations (Oncology TAUG)
- Compliance assessment with SDTMIG 3.3 and ADaMIG 1.1
- Risk assessment and recommendations

## Troubleshooting

### Issue: CDISC standard version not provided
**Solution:** Request user to provide version, call regulatory_guidelines_intelligence, present options, do not auto-select

### Issue: Dataset not compliant with CDISC standard
**Solution:** Document non-compliance, provide remediation recommendations, adjust design

### Issue: Variable naming conflicts between domains
**Solution:** Apply qualified naming conventions, document rationale, use domain prefixes when necessary, consult CDISC naming rules.

### Issue: Complex derivation logic cannot be fully specified
**Solution:** Break down into steps, provide detailed documentation, recommend programmer consultation, provide examples and pseudo-code.

### Issue: Missing mapping information for CRF fields
**Solution:** Flag for manual specification, provide context and source references, suggest data collection review, document assumptions.

### Issue: Controlled terminology mapping is ambiguous
**Solution:** Document mapping rules, provide examples, recommend terminology specialist consultation, reference CDISC CT publications.

### Issue: Analysis requirements are unclear or incomplete
**Solution:** Identify gaps, request clarification from statistician, document assumptions, suggest additional data collection if needed.

### Issue: Therapeutic area-specific requirements are unclear
**Solution:** Consult relevant TAUG documents, research therapeutic area best practices, engage therapeutic area experts, document considerations.

## Quality Assurance

### Pre-Execution Checks
- Verify all input documents are accessible and readable
- Confirm CDISC standard version is specified and supported
- Validate that therapeutic area is identified if TAUG-specific requirements exist
- Check that output format is valid and supported
- Ensure all required documents are provided
- Verify study_design_document is accessible
- Confirm cdisc_standard_version is provided
- Confirm regulatory_agency is supported
- Ensure access to regulatory guidelines intelligence and compliance assessment


### Post-Execution Validation
- Verify cdisc_standard_version is confirmed with user
- Confirm regulatory_guidelines_intelligence was called
- Confirm compliance_assessment_guideline_alignment was called
- Ensure dataset design complies with specified CDISC standard
- Verify report includes all required sections
- Verify transparency about version used
- Review generated specifications for completeness and accuracy
- Verify all required variables are included
- Confirm mapping logic is clear and implementable
- Validate that traceability is maintained throughout
- Ensure compliance with CDISC standards
- Check that all complex derivations are well-documented
- Verify that all source references are accurate

### Documentation Requirements
- Document version confirmation process
- Preserve all regulatory guidelines intelligence
- Preserve compliance assessment results
- Maintain clear audit trail
- Generate comprehensive report
- Ensure complete transparency
- Maintain clear file naming conventions
- Include comprehensive comments in specifications
- Document all assumptions and design decisions
- Provide source references for all mappings
- Generate summary reports with key metrics
- Include recommendations for implementation
- Ensure all documentation follows organizational standards

## Regulatory Compliance

### CDISC Standards
- Follow SDTM Implementation Guide (SDTMIG) specifications
- Follow ADaM Implementation Guide (ADaMIG) standards
- Apply relevant therapeutic area user guides (TAUGs)
- Use standard CDISC controlled terminology
- Maintain compliance with FDA and EMA submission requirements

### GCP Considerations
- Ensure data integrity and traceability requirements are met
- Support audit trail and documentation needs
- Facilitate reproducibility of data transformations
- Enable validation and verification processes

### Best Practices
- Follow industry best practices for CDISC implementation
- Implement efficient and maintainable data structures
- Support regulatory submission preparation
- Enable data review and quality assessment
- Facilitate cross-study data sharing and comparison
