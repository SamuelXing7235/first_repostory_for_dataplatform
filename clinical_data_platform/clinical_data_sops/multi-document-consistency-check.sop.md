# Multi-Document Consistency Check Workflow

## Overview

This SOP guides the systematic cross-referencing of multiple clinical trial documents to identify inconsistencies, discrepancies, and alignment issues. It ensures that key definitions and elements are consistent across Protocol, SAP, CRF, and other related documents, which is critical for trial quality and regulatory compliance.

## Parameters

- **documents** (required): Array of document objects with type and path

```json
{
"documents": [
{ "type": "Protocol", "path": "path/to/protocol.pdf" },
{ "type": "SAP", "path": "path/to/sap.docx" },
{ "type": "CRF", "path": "path/to/crf.pdf" }
]
}

```

- **check_rules** (required): Array of consistency check types to perform
  - Options: ["endpoints", "visits", "data_collection", "population", "variables", "all"]
- **comparison_mode** (optional, default: "moderate"): Mode for comparison ("strict", "moderate", "lenient")
- **output_format** (optional, default: "markdown"): Format for consistency report ("markdown", "json", "html")
- **include_suggestions** (optional, default: true): Whether to include resolution suggestions

**Constraints for parameter acquisition:**

- If all required parameters are already provided, You MUST proceed to the Steps
- If any required parameters are missing, You MUST ask for them before proceeding
- When asking for parameters, You MUST request all parameters in a single prompt
- When asking for parameters, You MUST use the exact parameter names as defined

## Steps

### 1. Document Preprocessing and Information Extraction

Extract structured information from all input documents.

**Constraints:**

- You MUST call `doc_understand_structured` skill for each input document
- You MUST extract key information into structured data objects
- You MUST preserve source location information (page numbers, sections)
- You MUST handle different document formats appropriately
- You SHOULD validate that all documents are accessible and readable
- You MUST NOT proceed if any document cannot be processed
- You MUST process documents systematically, not randomly

### 2. Systematic Comparison Process

Apply predefined comparison logic systematically across all documents.

**Constraints:**

- You MUST compare documents in logical order (Protocol → SAP → CRF)
- You MUST check each rule category comprehensively
- You MUST maintain audit trail of all comparisons performed
- You MUST apply non-random, systematic comparison logic
- You SHOULD document comparison methodology and assumptions
- You MUST NOT skip any requested check rules
- You MUST ensure complete coverage of all specified comparison areas

### 3. Consistency Rule Application

Apply specific consistency checks based on requested rules.

**Constraints:**

#### Endpoint Consistency Check

- You MUST compare endpoint names, definitions, and assessment timepoints
- You MUST identify mismatches in primary, secondary, and exploratory endpoints
- You MUST check measurement methods and evaluation criteria
- You MUST flag any discrepancies with severity assessment

#### Visit Schedule Consistency Check

- You MUST map Protocol Schedule of Assessments to CRF visits
- You MUST identify missing, extra, or misaligned visits
- You MUST compare assessment timing windows
- You MUST document any schedule conflicts

#### Data Collection Consistency Check

- You MUST verify SAP analysis variables have corresponding CRF fields
- You MUST identify CRF fields not used in SAP analysis
- You MUST check variable name and type consistency
- You MUST flag data collection gaps or redundancies

#### Population Definition Consistency Check

- You MUST compare Protocol inclusion/exclusion criteria with SAP populations
- You MUST identify contradictions or ambiguities
- You MUST verify population flag definitions
- You MUST document any population definition conflicts

### 4. Issue Classification and Risk Assessment

Classify identified inconsistencies by severity and assess potential impact.

**Constraints:**

- You MUST classify inconsistencies by severity (high, medium, low)
- You MUST assess potential impact on study conduct and analysis
- You MUST provide context-specific recommendations
- You MUST prioritize issues requiring immediate attention
- You SHOULD consider regulatory implications of identified issues
- You MUST document rationale for severity classifications
- You MAY suggest timeline for issue resolution

### 5. Report Generation

Generate detailed consistency report with actionable recommendations.

**Constraints:**

- You MUST generate detailed consistency report in specified format
- You MUST include source references for all identified issues
- You MUST provide actionable suggestions for resolution
- You MUST create summary statistics and consistency scores
- You SHOULD include executive summary for management review
- You MUST ensure report is comprehensive yet readable
- You MAY generate issue tracking tables for follow-up

## Examples

### Basic Protocol-SAP-CRF Consistency Check

**Input:**

```json
{
"documents": [
{ "type": "Protocol", "path": "protocol.pdf" },
{ "type": "SAP", "path": "sap.docx" },
{ "type": "CRF", "path": "crf.pdf" }
],
"check_rules": ["endpoints", "visits", "data_collection", "population"],
"comparison_mode": "moderate",
"output_format": "markdown"
}
```

**Output:** Comprehensive consistency report identifying endpoint mismatches, visit schedule discrepancies, data collection gaps, and population definition conflicts, with severity assessments and resolution recommendations.

### Version Comparison
**Input:**

```json
{
"documents": [
{ "type": "Protocol", "path": "protocol_v1.0.pdf" },
{ "type": "Protocol", "path": "protocol_v2.0.pdf" }
],
"check_rules": ["all"],
"comparison_mode": "strict",
"output_format": "html"
}

```

**Output:** Detailed version comparison report highlighting all changes, additions, and deletions between protocol versions.

## Troubleshooting

### Issue: Document parsing fails
**Solution:** Try alternative parsing methods, flag document for manual review, proceed with available documents, document limitations.

### Issue: Semantic ambiguity leads to uncertain conclusions
**Solution:** Flag as "requires human review", provide context for decision making, note confidence level, suggest clarification approach.

### Issue: Large number of minor inconsistencies
**Solution:** Group similar issues, prioritize by impact, provide summary statistics, create actionable issue tracking table.

### Issue: Version comparison shows extensive changes
**Solution:** Generate detailed change log, highlight critical changes, assess impact on study conduct, provide risk assessment.

### Issue: Conflicting requirements between documents
**Solution:** Document all conflicts, assess severity and impact, recommend resolution approach, flag for senior review if necessary.

