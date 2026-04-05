# Regulatory Guidelines Intelligence Workflow

## Overview
This SOP guides the intelligent retrieval and management of regulatory guidelines, standards, and requirements from global regulatory agencies. It ensures version management, supports version coexistence and time-point queries, provides complete transparency about guideline versions and acceptance periods, and requires mandatory user confirmation for version selection.

## Parameters
- **guideline_type** (required): Type of guideline or standard
  - Examples: "ICH E9", "CDISC SDTMIG", "FDA Guidance for Industry", "EMA Guideline"
  
- **regulatory_agency** (required): Regulatory agency
  - Examples: "FDA", "EMA", "PMDA", "NMPA", "ICH"

- **version** (optional): Specific version number
  - If specified, returns detailed information about that version
  - If not specified, returns all valid versions
  
- **time_point** (optional, default: "current"): Query time point
  - Format: "YYYY-MM-DD" or "current" or "submission_date"
  
- **include_deprecated** (optional, default: false): Whether to include deprecated versions
  
- **include_comparison** (optional, default: true): Whether to include version comparison

**Constraints for parameter acquisition:**
- If all required parameters are already provided, You MUST proceed to the Steps
- If any required parameters are missing, You MUST ask for them before proceeding
- When asking for parameters, You MUST request all parameters in a single prompt
- When asking for parameters, You MUST use the exact parameter names as defined

## Steps

### 1. Query Parameter Validation
Validate all input parameters.

**Constraints:**
- You MUST validate guideline_type is supported
- You MUST validate regulatory_agency is supported
- You SHOULD validate version format if provided
- You MUST validate time_point format if provided
- You MUST NOT proceed with invalid parameters
- You MUST document any validation issues

### 2. Guideline Information Retrieval
Retrieve guideline information from regulatory sources.

**Constraints:**
- You MUST retrieve guideline information from official sources
- You MUST ensure information is up-to-date
- You SHOULD retrieve information from multiple sources for verification
- You MUST document source and retrieval date
- You MUST NOT use outdated or unofficial sources
- You MUST verify information accuracy

### 3. Version Identification and Validation
Identify all valid versions and validate their acceptance.

**Constraints:**
- You MUST identify all valid versions for the guideline
- You MUST validate acceptance status for each regulatory agency
- You MUST identify acceptance periods for each version
- You SHOULD identify version coexistence periods
- You MUST identify deprecated versions and sunset dates
- You MUST document version status clearly

### 4. Version Comparison and Analysis
Compare different versions and identify key differences.

**Constraints:**
- You MUST compare all valid versions
- You MUST identify key differences between versions
- You SHOULD assess impact of differences
- You MUST identify migration considerations
- You SHOULD provide migration recommendations
- You MUST document comparison findings

### 5. Time-Point Analysis
Analyze version acceptance at specified time point.

**Constraints:**
- You MUST identify versions accepted at specified time point
- You MUST consider historical and future time points
- You SHOULD identify transition deadlines
- You MUST provide time-point-specific recommendations
- You MUST document time-point analysis

### 6. Regulatory Agency-Specific Analysis
Analyze agency-specific requirements and interpretations.

**Constraints:**
- You MUST identify agency-specific acceptance criteria
- You MUST identify agency-specific additional requirements
- YOU SHOULD identify agency-specific interpretations
- YOU MUST document agency-specific submission requirements
- YOU MUST consider multiple agencies if relevant

### 7. Recommendation Generation
Generate recommendations based on analysis.

**Constraints:**
- You MUST provide recommendations for different scenarios
- You MUST provide rationale for recommendations
- YOU SHOULD consider different use cases
- YOU MUST identify implementation considerations
- YOU MUST provide clear guidance
- YOU MUST avoid automatic version selection

### 8. User Interaction Preparation
Prepare user interaction for version confirmation.

**Constraints:**
- You MUST prepare clear interaction prompt
- You MUST provide complete version information
- YOU MUST provide multiple ways to specify version
- YOU MUST ask relevant clarifying questions
- YOU MUST ensure transparency
- YOU MUST NOT make automatic version selection

### 9. Comprehensive Report Generation
Generate comprehensive report with all findings.

**Constraints:**
- You MUST generate comprehensive report
- You MUST include all valid versions
- YOU MUST include version comparison
- YOU MUST include time-point analysis
- YOU MUST include recommendations
- YOU MUST include user interaction prompt
- YOU MUST ensure complete transparency
- YOU MUST document all sources

## Examples

### CDISC SDTMIG Version Query
**Input:**

```json
{
"guideline_type": "CDISC SDTMIG",
"regulatory_agency": "FDA",
"time_point": "current",
"include_comparison": true
}
```

**Output:** Comprehensive report including:
- Valid versions: 3.3 (current), 3.2 (valid but will expire)
- Version comparison with key differences
- Acceptance periods by agency
- Recommendations for different scenarios
- User interaction prompt for version confirmation

### ICH E9 Guideline Query
**Input:**

```json
{
"guideline_type": "ICH E9",
"regulatory_agency": "FDA",
"version": "1998"
}
```


**Output:** Detailed report including:
- ICH E9 1998 version information
- Regulatory acceptance status
- E9(R1) addendum information
- Recommendations for considering E9(R1)
- User confirmation of version selection

## Troubleshooting

### Issue: Guideline type not supported
**Solution:** Document unsupported guideline, suggest alternatives, request clarification from user

### Issue: Regulatory agency not supported
**Solution:** Document unsupported agency, suggest similar agencies, request clarification from user

### Issue: Version information not available
**Solution:** Document unavailability, suggest contacting regulatory agency directly, provide partial information

### Issue: Conflicting information from sources
**Solution:** Document conflicts, identify most authoritative source, note uncertainty in report

### Issue: Time point in the future with uncertain acceptance
**Solution:** Document uncertainty, provide best available information, recommend confirming with regulatory agency

## Quality Assurance

### Pre-Execution Checks
- Verify guideline_type is supported
- Confirm regulatory_agency is supported
- Validate version format if provided
- Check time_point format if provided
- Ensure access to regulatory information sources

### Post-Execution Validation
- Verify information is from official sources
- Confirm information is current and accurate
- Validate all versions are correctly identified
- Check that acceptance periods are accurate
- Ensure user interaction prompt is clear and complete
- Verify report is comprehensive and transparent

### Documentation Requirements
- Document all sources and retrieval dates
- Preserve all version information and acceptance periods
- Maintain clear audit trail of analysis
- Generate comprehensive report
- Document all assumptions and limitations
- Ensure complete transparency
