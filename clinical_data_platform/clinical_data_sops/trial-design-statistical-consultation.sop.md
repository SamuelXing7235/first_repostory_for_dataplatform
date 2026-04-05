# Trial Design Statistical Consultation Workflow

## Overview

This SOP guides the statistical consultation for clinical trial design, ensuring alignment with regulatory guidelines and latest statistical methodologies. It requires mandatory confirmation of guideline versions and incorporates the latest regulatory and methodological intelligence.  This SOP provides expert statistical guidance for clinical trial design, supporting biostatisticians and clinical teams in making informed decisions about study design parameters. It combines statistical theory with practical considerations to ensure studies are adequately powered and methodologically sound.

## Parameters

- **protocol_document** (required): Clinical trial protocol document
  - File path or content of the protocol
  
- **guideline_version** (required): Regulatory guideline version
  - Must be specified by user (e.g., "ICH E9 1998", "ICH E9(R1) 2019")
  - Cannot be auto-selected
  - If not provided, must call regulatory_guidelines_intelligence first
  
- **regulatory_agency** (required): Target regulatory agency
  - Examples: "FDA", "EMA", "PMDA", "NMPA"
  
- **methodology_preferences** (optional): User's methodology preferences
  - Examples: "adaptive_design", "bayesian", "enrichment"
  
- **trial_phase** (optional): Phase of clinical trial
  - Examples: "Phase I", "Phase II", "Phase III", "Phase IV"

- **study_design** (required): Study design parameters

  ```json
  {
  "design_type": "parallel", // parallel, crossover, factorial, adaptive
  "arms": ["Treatment", "Placebo"],
  "allocation_ratio": [1, 1],
  "primary_endpoint": {
  "type": "continuous", // continuous, categorical, time_to_event, count
  "description": "Change from baseline in systolic blood pressure",
  "measurement_scale": "mmHg",
  "assessment_timepoints": ["Baseline", "Week 12"]
  }
  }

  ```

  - **sample_size_parameters** (optional): Parameters for sample size calculation
- **randomization_parameters** (optional): Randomization design parameters
- **analysis_parameters** (optional): Statistical analysis preferences

**Constraints for parameter acquisition:**
- If all required parameters are already provided, You MUST proceed to the Steps
- If any required parameters are missing, You MUST ask for them before proceeding
- When asking for parameters, You MUST request all parameters in a single prompt
- When asking for parameters, You MUST use the exact parameter names as defined
- **CRITICAL**: guideline_version MUST be provided by user, cannot be auto-selected


## Steps

### 0. Pre-Analysis: Guideline Version Confirmation (NEW)
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
Retrieve latest regulatory guidelines and requirements.

**Constraints:**
- You MUST call `regulatory_guidelines_intelligence` with:
  - guideline_type: "ICH E9"
  - guideline_version: [user-specified version]
  - regulatory_agency: [user-specified agency]
- You MUST retrieve relevant regulatory requirements
- You MUST identify any recent updates or changes
- You MUST document regulatory considerations

### 2. Statistical Methodology Intelligence (NEW)
Retrieve latest statistical methodology developments.

**Constraints:**
- You MUST call `statistical_methodology_intelligence` with:
  - methodology_domain: "clinical_trial_design"
  - application_context: [trial_phase]
  - regulatory_agency: [user-specified agency]
- You MUST retrieve latest methodology developments
- You MUST assess regulatory acceptance of methodologies
- You MUST identify suitable methodologies for the trial

### 3. Protocol Analysis
Analyze the protocol document to understand trial design.

**Constraints:**
- You MUST extract key trial design elements
- You MUST identify primary and secondary endpoints
- You MUST understand sample size and power considerations
- You MUST identify randomization and blinding strategies

### 4. Parameter Understanding and Validation

Extract, receive, and validate key design parameters.

**Constraints:**

- You MUST extract or receive key design parameters from user input or protocol
- You MUST validate parameter values are within reasonable ranges
- You MUST identify missing parameters and request if needed
- You SHOULD assess feasibility of proposed design
- You MUST document all assumptions made during parameter validation
- You MUST NOT proceed with invalid or unrealistic parameters
- You MAY suggest alternative parameter values if current values are problematic

### 5. Sample Size Calculation

Perform sample size calculation with comprehensive analysis.

**Constraints:**

- You MUST select appropriate formula based on design type and endpoint
- You MUST perform sample size calculation with provided parameters
- You MUST adjust for dropout rate and other practical considerations
- You MUST generate sensitivity analysis for key assumptions
- You SHOULD present results with clear interpretation
- You MUST document all calculations and assumptions
- You MUST align calculations with ICH E9 guidelines
- YOU MAY suggest alternative designs if primary design is not feasible

### 6. Statistical Model Selection

Recommend appropriate statistical models based on study characteristics.

**Constraints:**

- You MUST analyze endpoint characteristics and study design
- You MUST recommend primary analysis method with justification
- You MUST identify key assumptions and diagnostic approaches
- You SHOULD suggest alternative methods for robustness
- You MUST consider regulatory expectations and guidelines
- You MUST document rationale for model selection
- You MAY provide model comparison tables if multiple approaches are viable

### 7. Randomization Design

Design appropriate randomization scheme for the study.

**Constraints:**

- You MUST recommend appropriate randomization method
- You MUST identify relevant stratification factors
- You MUST design block sizes and allocation scheme
- You MUST provide implementation guidance
- You MUST generate example randomization list structure
- You SHOULD consider operational feasibility
- You MUST document randomization procedures for blinding maintenance
- YOU MAY suggest adaptive randomization if appropriate

### 8. Statistical Design Recommendations
Provide statistical design recommendations based on analysis.

**Constraints:**
- You MUST provide recommendations aligned with specified guideline version
- You MUST consider regulatory acceptance
- You MUST provide rationale for recommendations
- You MUST identify implementation considerations

### 9. User Interaction Preparation
Prepare user interaction for confirmation.

**Constraints:**
- You MUST prepare clear interaction prompt
- You MUST provide complete information
- You MUST ask relevant clarifying questions
- You MUST ensure transparency

### 10. Comprehensive Report Generation
Generate comprehensive consultation report.

**Constraints:**
- You MUST include all regulatory considerations
- You MUST include methodology recommendations
- You MUST include user interaction prompt
- You MUST ensure complete transparency
-   
### 11. SAP Section Drafting

Draft statistical methods sections following ICH E9 structure.

**Constraints:**

- You MUST structure statistical methods section following ICH E9
- You MUST include sample size justification with calculations
- You MUST document randomization procedures
- You MUST describe analysis populations and methods
- You MUST address multiplicity and missing data handling
- You MUST ensure content is clear and reproducible
- You SHOULD provide examples for complex analyses
- YOU MAY include placeholder text for sponsor-specific requirements

## Examples

### Phase III Trial Design Consultation
**Input:**

```json
{
"protocol_document": "/protocols/study_123.pdf",
"guideline_version": "ICH E9 1998",
"regulatory_agency": "FDA",
"trial_phase": "Phase III"
}
```

**Output:** Comprehensive report including:
- Regulatory considerations based on ICH E9 1998
- Latest methodology developments
- Statistical design recommendations
- User interaction prompt for confirmation


### Basic Trial Design Setup

**Input:**

```json
{
"study_design": {
"design_type": "parallel",
"arms": ["Treatment", "Placebo"],
"allocation_ratio": [1, 1],
"primary_endpoint": {
"type": "continuous",
"description": "Change from baseline in systolic blood pressure",
"measurement_scale": "mmHg",
"assessment_timepoints": ["Baseline", "Week 12"]
}
},
"sample_size_parameters": {
"effect_size": 5.0,
"standard_deviation": 15.0,
"alpha": 0.05,
"power": 0.80,
"dropout_rate": 0.10,
"two_sided": true
}
}
```

**Output:** Comprehensive statistical consultation including sample size calculation (128 subjects total), ANCOVA model recommendation, stratified block randomization design, and SAP statistical methods section draft.

### Complex Survival Analysis Design

**Input:**

```json
{
"study_design": {
"design_type": "parallel",
"arms": ["Experimental", "Control"],
"primary_endpoint": {
"type": "time_to_event",
"description": "Overall Survival",
"assessment_timepoints": ["Continuous"]
}
},
"sample_size_parameters": {
"hazard_ratio": 0.75,
"median_survival_control": 12,
"alpha": 0.05,
"power": 0.90,
"accrual_duration": 24,
"follow_up_duration": 12
}
}
```

**Output:** Survival analysis design with sample size calculation (350 events required), Cox proportional hazards model recommendation, and detailed SAP section for time-to-event analysis.



## Troubleshooting

### Issue: Guideline version not provided
**Solution:** Request user to provide version, call regulatory_guidelines_intelligence, present options, do not auto-select

### Issue: Methodology not suitable for trial
**Solution:** Document limitations, provide alternatives, explain rationale

### Issue: Insufficient or unrealistic parameter values

**Solution:** Flag problematic parameters, suggest reasonable ranges based on literature or historical data, request clarification, provide sensitivity analysis.

### Issue: Complex design beyond standard formulas

**Solution:** Identify complexity, recommend simulation-based approaches, suggest consultation with senior statistician, provide framework for advanced analysis.

### Issue: Conflicting design requirements

**Solution:** Identify conflicts, assess trade-offs, provide options with pros and cons, document rationale for recommendations.

### Issue: Regulatory uncertainty for novel designs

**Solution:** Flag regulatory considerations, suggest early consultation with authorities, document rationale, provide references to relevant guidelines.

### Issue: Sample size is prohibitively large

**Solution:** Suggest design modifications (e.g., different endpoints, relaxed assumptions), consider adaptive designs, provide feasibility analysis, discuss with study team.

 
## Quality Assurance

### Pre-Execution Checks

- Verify protocol_document is accessible
- Confirm guideline_version is provided
- Confirm regulatory_agency is supported
- Ensure access to regulatory and methodology intelligence
- Verify all required parameters are provided and valid
- Confirm design parameters are within reasonable ranges
- Check that statistical methods are appropriate for endpoint types
- Validate that regulatory guidelines are being followed

### Post-Execution Validation
- Verify guideline_version is confirmed with user
- Confirm regulatory_guidelines_intelligence was called
- Confirm statistical_methodology_intelligence was called
- Ensure report includes all required sections
- Verify transparency about versions used
- Review all calculations for accuracy
- Verify that assumptions are clearly documented
- Confirm that recommendations are actionable and justified
- Validate that SAP draft follows ICH E9 structure
- Ensure all outputs are comprehensive and clear

### Documentation Requirements
- Document version confirmation process
- Preserve all regulatory and methodology intelligence
- Maintain clear audit trail
- Generate comprehensive report
- Ensure complete transparency
- Maintain clear audit trail of all calculations and decisions
- Document all assumptions and their rationale
- Preserve references to statistical literature and guidelines
- Generate comprehensive summary report
- Provide clear recommendations for next steps
