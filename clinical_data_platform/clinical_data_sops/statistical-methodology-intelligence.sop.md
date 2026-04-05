# Statistical Methodology Intelligence Workflow

## Overview
This SOP guides the intelligent retrieval and management of the latest statistical methodology developments, including new statistical methods, models, frameworks, and clinical trial design approaches. It provides methodology comparison, regulatory acceptance assessment, and methodology selection recommendations to support informed statistical methodology decisions with mandatory user confirmation and complete transparency.

## Parameters
- **methodology_domain** (required): Methodology domain
  - Examples: "clinical_trial_design", "statistical_methods", "multiplicity", "missing_data", "bayesian_methods", "estimands"
  
- **application_context** (required): Application context
  - Examples: "phase_iii_trial", "phase_ii_trial", "exploratory_analysis", "regulatory_submission"

- **trial_type** (optional): Type of clinical trial
  - Examples: "parallel", "crossover", "factorial", "adaptive", "enrichment"
  
- **endpoint_type** (optional): Type of endpoint
  - Examples: "continuous", "binary", "time_to_event", "count", "ordinal"
  
- **methodology_name** (optional): Specific methodology name
  - Examples: "sample_size_reestimation", "gatekeeping", "MMRM", "multiple_imputation"
  
- **regulatory_agency** (optional): Target regulatory agency
  - Examples: "FDA", "EMA", "PMDA", "NMPA"

**Constraints for parameter acquisition:**
- If all required parameters are already provided, You MUST proceed to the Steps
- If any required parameters are missing, You MUST ask for them before proceeding
- When asking for parameters, You MUST request all parameters in a single prompt
- When asking for parameters, You MUST use the exact parameter names as defined

## Steps

### 1. Query Parameter Validation
Validate all input parameters.

**Constraints:**
- You MUST validate methodology_domain is supported
- You MUST validate application_context is relevant
- You SHOULD validate trial_type if provided
- You MUST NOT proceed with invalid parameters
- You MUST document any validation issues

### 2. Methodology Information Retrieval
Retrieve methodology information from authoritative sources.

**Constraints:**
- You MUST retrieve information from official regulatory sources
- You MUST retrieve information from statistical literature
- You SHOULD retrieve information from multiple sources for verification
- You MUST document source and retrieval date
- You MUST NOT use outdated or unverified sources
- You MUST verify information accuracy

### 3. Regulatory Acceptance Assessment
Assess regulatory acceptance of methodologies.

**Constraints:**
- You MUST assess acceptance by each regulatory agency
- You MUST identify guidance documents
- You MUST identify acceptance conditions
- YOU SHOULD identify limitations and constraints
- YOU MUST document regulatory requirements
- YOU MUST consider multiple agencies if relevant

### 4. Methodology Comparison and Evaluation
Compare different methodologies and evaluate trade-offs.

**Constraints:**
- You MUST compare relevant methodologies
- You MUST identify advantages and disadvantages
- YOU SHOULD assess statistical properties
- YOU MUST consider implementation complexity
- YOU SHOULD provide comparative analysis

### 5. Application Context Analysis
Analyze methodology suitability for specific context.

**Constraints:**
- You MUST analyze suitability for specified context
- You MUST consider trial phase and design
- YOU SHOULD consider endpoint characteristics
- YOU MUST consider sample size and power
- YOU MUST provide context-specific recommendations

### 6. Statistical Software Assessment
Assess statistical software capabilities for methodologies.

**Constraints:**
- You MUST assess SAS capabilities
- You MUST assess R capabilities
- YOU SHOULD assess Python capabilities
- YOU MUST identify software limitations
- YOU MUST provide software recommendations

### 7. Recommendation Generation
Generate methodology recommendations based on analysis.

**Constraints:**
- You MUST provide context-specific recommendations
- You MUST provide rationale for recommendations
- YOU SHOULD consider multiple factors
- YOU MUST identify implementation considerations
- YOU MUST provide clear guidance

### 8. User Interaction Preparation
Prepare user interaction for methodology confirmation.

**Constraints:**
- You MUST prepare clear interaction prompt
- You MUST provide complete methodology information
- YOU MUST provide multiple selection options
- YOU MUST ask relevant clarifying questions
- YOU MUST ensure transparency

### 9. Comprehensive Report Generation
Generate comprehensive report with all findings.

**Constraints:**
- You MUST generate comprehensive report
- You MUST include all relevant methodologies
- YOU MUST include regulatory acceptance information
- YOU MUST include methodology comparison
- YOU MUST include recommendations
- YOU MUST include user interaction prompt
- YOU MUST ensure complete transparency
- YOU MUST document all sources

## Examples

### Clinical Trial Design Query
**Input:**

```json
{
"methodology_domain": "clinical_trial_design",
"application_context": "phase_iii_trial",
"trial_type": "parallel",
"endpoint_type": "continuous",
"regulatory_agency": "FDA"
}
```


**Output:** Comprehensive report including:
- Adaptive designs (sample size reestimation, adaptive randomization)
- Enrichment designs (biomarker enrichment)
- Bayesian methods (adaptive designs, hierarchical models)
- Regulatory acceptance by FDA
- Methodology comparison
- Recommendations for Phase III continuous endpoint
- User interaction prompt for methodology confirmation

### Statistical Methods Query
**Input:**

```json
{
"methodology_domain": "statistical_methods",
"application_context": "phase_iii_trial",
"endpoint_type": "time_to_event",
"regulatory_agency": "EMA"
}
```


**Output:** Comprehensive report including:
- Survival analysis methods (Cox models, parametric models)
- Multiplicity adjustments (gatekeeping, graphical approaches)
- Missing data methods (multiple imputation, MMRM)
- Regulatory acceptance by EMA
- Methodology comparison
- Recommendations for time-to-event endpoint
- User interaction prompt for methodology confirmation

## Troubleshooting

### Issue: Methodology domain not supported
**Solution:** Document unsupported domain, suggest alternatives, request clarification

### Issue: Regulatory acceptance unclear
**Solution:** Document uncertainty, recommend regulatory interaction, provide best available information

### Issue: Conflicting information from sources
**Solution:** Document conflicts, identify most authoritative source, note uncertainty in report

### Issue: Methodology not suitable for specified context
**Solution:** Document limitations, provide alternatives, explain rationale

### Issue: Software capabilities unclear
**Solution:** Document uncertainty, recommend testing, provide best available information

## Quality Assurance

### Pre-Execution Checks
- Verify methodology_domain is supported
- Confirm application_context is relevant
- Validate trial_type if provided
- Check endpoint_type if provided
- Ensure access to methodology information sources

### Post-Execution Validation
- Verify information is from official sources
- Confirm regulatory acceptance is accurately assessed
- Validate all methodologies are correctly identified
- Check that methodology comparison is balanced
- Ensure user interaction prompt is clear and complete
- Verify report is comprehensive and transparent

### Documentation Requirements
- Document all sources and retrieval dates
- Preserve all methodology information and regulatory acceptance data
- Maintain clear audit trail of analysis
- Generate comprehensive report
- Document all assumptions and limitations
- Ensure complete transparency
