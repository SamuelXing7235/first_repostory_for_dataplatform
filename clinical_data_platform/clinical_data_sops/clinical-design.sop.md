# Clinical Trial Design Workflow

## Overview
This SOP guides the comprehensive clinical trial design process, including protocol development, SAP creation, and CRF design. It ensures consistency across all design documents and compliance with regulatory requirements (GCP, ICH guidelines, and local regulations).

## Parameters
- **protocol_type** (required): Type of clinical trial (Phase I, II, III, IV)
- **therapeutic_area** (required): Therapeutic area (e.g., oncology, cardiology, neurology)
- **study_design** (required): Study design (parallel, crossover, factorial, adaptive)
- **primary_endpoint** (required): Description of primary endpoint with measurement method
- **sample_size** (optional, default: null): Target sample size if known
- **duration** (optional, default: "12 months"): Study duration
- **target_regulatory** (optional, default: "FDA"): Primary regulatory authority (FDA, EMA, NMPA)
- **existing_documents** (optional, default: []): Paths to existing draft documents

**Constraints for parameter acquisition:**
- If all required parameters are already provided, You MUST proceed to the Steps
- If any required parameters are missing, You MUST ask for them before proceeding
- When asking for parameters, You MUST request all parameters in a single prompt
- When asking for parameters, You MUST use the exact parameter names as defined

## Steps

### 1. Document Analysis Phase
Analyze existing documents and extract key information for trial design.

**Constraints:**
- You MUST call the `doc_understand_structured` skill to parse any existing protocol drafts
- You MUST extract key elements: objectives, endpoints, inclusion/exclusion criteria, study design, schedule of assessments
- You SHOULD identify gaps or inconsistencies in existing documentation
- You MAY suggest additional documents needed for complete design
- You MUST preserve source location information for all extracted content
- You MUST analyze documents systematically, section by section, not randomly

### 2. Statistical Design Consultation
Perform statistical calculations and design recommendations.

**Constraints:**
- You MUST call the `trial_design_statistical_consult` skill for sample size calculation
- You MUST recommend appropriate statistical models based on endpoint types
- You SHOULD provide sensitivity analysis for sample size calculations
- You MUST document all statistical assumptions and calculations
- You MUST ensure statistical methods align with ICH E9 guidelines
- You MAY suggest alternative designs if primary design is not feasible

### 3. Multi-Document Consistency Check
Ensure alignment across Protocol, SAP, and CRF documents.

**Constraints:**
- You MUST call the `doc_consistency_check_multi` skill to cross-reference documents
- You MUST verify endpoint definitions match across all documents
- You MUST check visit schedule consistency between Protocol and CRF
- You SHOULD flag any discrepancies for human review
- You MUST generate a detailed consistency report with risk assessment
- You MUST compare documents systematically, following a predefined order (Protocol → SAP → CRF)

### 4. CDISC Dataset Design
Design SDTM and ADaM dataset structures based on trial design.

**Constraints:**
- You MUST call the `cdisc_dataset_design` skill to create dataset specifications
- You MUST ensure all planned endpoints have corresponding analysis datasets
- You SHOULD follow relevant CDISC implementation guides (SDTMIG, ADaMIG)
- You MUST generate mapping specifications for all datasets
- You SHOULD consider therapeutic area-specific requirements (TAUGs)
- You MUST ensure traceability from CRF to SDTM to ADaM

### 5. Quality and Compliance Review
Perform final quality checks and regulatory compliance verification.

**Constraints:**
- You MUST verify compliance with ICH E6 (GCP), ICH E9, and relevant regulatory guidelines
- You SHOULD check for completeness of all required sections
- You MUST generate a compliance report with any issues identified
- You MAY suggest improvements based on best practices
- You MUST ensure all design decisions are documented and justified
- You SHOULD assess regulatory submission readiness

### 6. Risk Assessment and Mitigation
Identify potential risks and develop mitigation strategies.

**Constraints:**
- You MUST identify risks related to study design, statistical power, and operational feasibility
- You SHOULD assess impact of identified risks on study success
- You MUST propose mitigation strategies for high-risk items
- You MAY recommend contingency plans
- You MUST document all identified risks and mitigation approaches
- You SHOULD consider historical data and lessons learned from similar studies

## Examples

### Basic Trial Design Setup
**Input:**

input_json_schema: |-
   {
    "protocol_type": "Phase II",
    "therapeutic_area": "cardiology",
    "study_design": "adaptive",
    "primary_endpoint": "Change in ejection fraction from baseline to 12 weeks",
    "sample_size": null,
    "duration": "6 months",
    "target_regulatory": "EMA",
    "existing_documents": [
        "draft_protocol.docx",
        "preliminary_sap.pdf"
    ]
   }

**Output:** Adaptive design package including:
- Adaptive design features and interim analysis plans
- Sample size re-estimation methodology
- Statistical boundaries and stopping rules
- Operational considerations for adaptive elements
- Regulatory compliance assessment for adaptive design

## Troubleshooting

### Issue: Inconsistent endpoint definitions
**Solution:** Use the `doc_consistency_check_multi` skill to identify specific discrepancies, review source documents for clarification, and establish clear, consistent definitions across all documents.

### Issue: Sample size calculation fails
**Solution:** Verify all required parameters (effect size, alpha, beta, standard deviation, dropout rate) are provided. If parameters are uncertain, perform sensitivity analysis with a range of plausible values. Consult with statistician for complex designs.

### Issue: CDISC mapping unclear
**Solution:** Review annotated CRF and consult relevant therapeutic area user guides (TAUGs) for domain-specific mapping rules. Consider creating mapping specification documents with clear traceability.

### Issue: Regulatory compliance concerns
**Solution:** Review relevant ICH guidelines and regulatory authority requirements. Generate compliance checklist and address any gaps. Consider seeking regulatory affairs consultation for complex issues.

### Issue: Study design not feasible
**Solution:** Assess operational constraints, timeline, and budget considerations. Propose alternative designs that maintain scientific validity while addressing practical limitations. Document rationale for design choices.

## Quality Assurance

### Pre-Execution Checks
- Verify all required parameters are provided and valid
- Confirm document files are accessible and readable
- Check that required skills are available and functional
- Validate that output directories exist and are writable

### Post-Execution Validation
- Review generated documents for completeness and accuracy
- Verify consistency across all generated artifacts
- Confirm all regulatory requirements are addressed
- Validate that all extracted information is properly sourced
- Ensure risk assessment is comprehensive and actionable

### Documentation Requirements
- Maintain audit trail of all processing steps
- Document all assumptions and decisions made
- Preserve source references for all extracted information
- Generate comprehensive quality report
- Provide clear recommendations for next steps

