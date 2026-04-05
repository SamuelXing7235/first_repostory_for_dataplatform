# Project Manager Task Orchestration Workflow

## Overview

This SOP guides the comprehensive project management and task orchestration for all clinical data analysis requests. It ensures that every user request is properly decomposed, executed, validated, and completed with self-consistent, precise answers that fully address user needs.   The Project Manager coordinates all Skills and SOPs in the clinical data analysis platform. It manages workflow orchestration, parameter handling, user interaction, and ensures complete transparency about versions, guidelines, and technologies used.

## Parameters

- **user_request** (required): The original user request/question
- **available_skills** (optional): Array of available skills for task execution
- **execution_constraints** (optional): Constraints on task execution (time, resources, etc.)
- **quality_thresholds** (optional): Minimum quality thresholds for results
- **iteration_limit** (optional, default: 5): Maximum number of iterations for refinement
- **user_preferences** (optional): User preferences for execution approach

**Constraints for parameter acquisition:**

- If all required parameters are already provided, You MUST proceed to the Steps
- If any required parameters are missing, You MUST ask for them before proceeding
- When asking for parameters, You MUST request all parameters in a single prompt
- When asking for parameters, You MUST use the exact parameter names as defined

## Steps

### 1. Request Analysis and Understanding

Analyze user request to understand intent, complexity, and requirements.

**Constraints:**

- You MUST analyze user request intent and objectives
- You MUST identify key questions and requirements
- You MUST assess request complexity and scope
- YOU SHOULD identify implicit requirements
- YOU MUST document understanding of request
- YOU MUST NOT proceed without clear understanding
- YOU SHOULD ask clarifying questions if request is ambiguous

### 2. Task Decomposition and Planning

Decompose request into executable tasks with dependencies.

**Constraints:**

- You MUST decompose request into manageable tasks
- You MUST identify task dependencies and execution order
- You MUST map tasks to appropriate skills
- YOU SHOULD estimate task duration and resources
- YOU MUST prioritize tasks appropriately
- YOU MUST create execution plan
- YOU MUST document task decomposition rationale
- YOU MUST ensure all required aspects are covered

### 3. Skill Invocation and Task Execution

Execute tasks by invoking appropriate skills in correct order.

**Constraints:**

- You MUST invoke skills in correct dependency order
- You MUST manage parameter passing between skills
- You MUST track execution progress
- YOU SHOULD handle errors gracefully
- YOU MUST log all skill invocations and results
- YOU MUST respect task dependencies
- YOU SHOULD handle parallel execution when possible
- YOU MUST document all executions

### 4. Result Collection and Integration

Collect and integrate results from all executed tasks.

**Constraints:**

- You MUST collect results from all executed skills
- You MUST integrate data from multiple sources
- YOU SHOULD maintain context across executions
- YOU MUST identify and resolve conflicts
- YOU MUST document integration process
- YOU MUST preserve traceability to source skills
- YOU SHOULD identify gaps in results
- YOU MUST ensure all results are properly formatted

### 5. Consistency and Completeness Validation

Validate that results are consistent and complete.

**Constraints:**

- You MUST validate internal consistency of results
- You MUST check cross-result consistency
- You MUST verify all required tasks are completed
- YOU MUST identify any gaps or inconsistencies
- YOU SHOULD assess quality of results
- YOU MUST document validation findings
- YOU MUST flag issues requiring resolution
- YOU MUST assess overall completeness

### 6. Gap Identification and Resolution

Identify gaps and inconsistencies and resolve them.

**Constraints:**

- You MUST identify all gaps in results
- You MUST identify all inconsistencies
- You MUST assess impact of gaps and inconsistencies
- YOU SHOULD determine resolution strategies
- YOU MUST execute additional tasks to fill gaps
- YOU MUST resolve inconsistencies through additional analysis
- YOU MUST document resolution process
- YOU MUST validate resolutions

### 7. Iterative Refinement

Iteratively refine results until complete and consistent.

**Constraints:**

- You MUST iterate until results are complete
- You MUST iterate until results are consistent
- YOU SHOULD use iteration limit to prevent infinite loops
- YOU MUST document each iteration
- YOU MUST assess improvement with each iteration
- YOU MUST stop when quality thresholds are met
- YOU MUST document final iteration results
- YOU MUST assess convergence

### 8. Final Answer Generation

Generate final answer that precisely addresses user question.

**Constraints:**

- You MUST generate answer that addresses user question
- You MUST ensure answer is comprehensive
- You MUST ensure answer is self-consistent
- You MUST include supporting evidence
- YOU SHOULD provide clear recommendations
- YOU MUST document answer generation process
- YOU MUST validate answer precision
- YOU MUST ensure answer is actionable

### 9. Project Documentation and Reporting

Document entire project execution and generate comprehensive report.

**Constraints:**

- You MUST document all tasks executed
- You MUST document all skills invoked
- You MUST document all results obtained
- You MUST document validation findings
- You MUST generate comprehensive project report
- YOU SHOULD provide executive summary
- YOU MUST maintain audit trail
- YOU MUST ensure traceability

## Examples

### Comprehensive Efficacy and Safety Analysis Request

**Input:**

```json
{
"user_request": "Please analyze the efficacy and safety results for Study XYZ and provide a comprehensive interpretation for regulatory submission",
"execution_constraints": {
"max_duration_minutes": 60,
"priority": "high"
},
"quality_thresholds": {
"minimum_quality_score": 0.85,
"minimum_consistency_score": 0.90
}
}
```

**Output:** Comprehensive project execution including:

- Task decomposition into 5 executable tasks
- Skill invocation (doc_understand_structured, statistical_results_review_interpret, sap_compliance_statistical_validation, exploratory_data_analysis_auto)
- Result integration and consistency validation
- Gap identification and resolution (none identified)
- Final answer with comprehensive efficacy and safety interpretation
- Complete project documentation and audit trail

### Statistical Review Request

**Input:**

```json
{
"user_request": "Review the statistical results for the primary endpoint and provide clinical interpretation",
"user_preferences": {
"focus": "clinical_significance",
"detail_level": "comprehensive"
}
}
```

**Output:** Focused project execution including:

- Task decomposition into 3 tasks (load documents, review results, interpret clinically)
- Skill invocation (doc_understand_structured, statistical_results_review_interpret)
- Result integration focusing on clinical significance
- Consistency validation
- Final answer with detailed clinical interpretation
- Complete project documentation

## Troubleshooting

### Issue: Task execution fails

**Solution:** Log error, assess impact on overall project, attempt recovery with alternative approach, document failure, proceed with available results if possible, recommend manual intervention if critical.

### Issue: Results are inconsistent

**Solution:** Identify source of inconsistency, execute additional validation tasks, resolve through additional analysis, document resolution process, re-validate after resolution.

### Issue: Gaps identified in results

**Solution:** Identify specific gaps, determine required additional tasks, execute tasks to fill gaps, validate filled gaps, document process, re-assess completeness.

### Issue: User request is unclear or ambiguous

**Solution:** Ask clarifying questions, document assumptions made, proceed with best interpretation, validate interpretation with user, be prepared to adjust based on feedback.

### Issue: Iteration limit reached without completion

**Solution:** Document incomplete status, identify remaining issues, provide partial results with clear limitations, recommend next steps, suggest manual intervention if needed.

### Issue: Quality thresholds not met

**Solution:** Identify quality issues, execute additional refinement tasks, adjust thresholds if unrealistic, document quality assessment, provide best available results with limitations noted.

## Quality Assurance

### Pre-Execution Checks

- Verify user request is clear and understandable
- Confirm required skills are available
- Validate execution constraints are reasonable
- Check that quality thresholds are defined and achievable
- Ensure iteration limit is appropriate

### Post-Execution Validation

- Verify all tasks were completed successfully
- Confirm all results are consistent and coherent
- Validate that final answer addresses user question precisely
- Ensure documentation is complete and comprehensive
- Check that quality thresholds were met
- Verify audit trail is complete

### Documentation Requirements

- Maintain complete audit trail of all actions
- Document all task executions and results
- Preserve all skill invocation logs
- Generate comprehensive project report
- Document all decisions and rationale
- Maintain traceability throughout execution
- Preserve all intermediate results
- Document all validation findings
