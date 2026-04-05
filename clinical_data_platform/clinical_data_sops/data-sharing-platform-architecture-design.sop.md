# Data Sharing Platform Architecture Design Workflow

## Overview
This SOP provides comprehensive cloud-native architecture design for clinical data sharing platforms. It adheres to FAIR principles (Findable, Accessible, Interoperable, Reusable) and security best practices while suggesting appropriate cloud services (AWS, Azure, GCP) for data storage, computing, user authentication, and API gateways, enabling secure, compliant, and efficient sharing of clinical trial data.

## Parameters
- **platform_requirements** (required): JSON object describing platform needs
    ```json
    {
    "data_volume": {
    "current_size_tb": 10,
    "projected_growth_tb_per_year": 5,
    "data_types": ["clinical_trials", "real_world_evidence", "genomics"]
    },
    "user_scale": {
    "concurrent_users": 100,
    "total_users": 1000,
    "user_types": ["researchers", "clinicians", "data_scientists", "external_partners"]
    },
    "security_requirements": {
    "compliance_standards": ["HIPAA", "GDPR", "21 CFR Part 11"],
    "data_classification": ["PHI", "PII", "de-identified"],
    "audit_requirements": true
    },
    "performance_requirements": {
    "availability_sla": "99.9%",
    "max_latency_ms": 500,
    "throughput_requests_per_second": 1000
    },
    "advanced_features": {
    "federated_learning": false,
    "confidential_computing": true,
    "ai_ml_capabilities": true
    }
    }
    ```

- **cloud_provider** (optional): Preferred cloud provider ("AWS", "Azure", "GCP", "multi-cloud")
- **budget_constraints** (optional): Budget limitations and cost optimization requirements
- **timeline** (optional): Project timeline and phased implementation plan
- **existing_systems** (optional): Legacy systems requiring integration
- **geographic_requirements** (optional): Data residency and geographic distribution requirements

**Constraints for parameter acquisition:**
- If all required parameters are already provided, You MUST proceed to the Steps
- If any required parameters are missing, You MUST ask for them before proceeding
- When asking for parameters, You MUST request all parameters in a single prompt
- When asking for parameters, You MUST use the exact parameter names as defined

## Steps

### 1. Requirements Analysis and Assessment
Analyze platform requirements and assess technical and business needs.

**Constraints:**
- You MUST analyze platform requirements from input JSON
- You MUST assess data volume, user scale, and performance needs
- You MUST identify security and compliance requirements
- You MUST evaluate integration needs with existing systems
- You MUST determine advanced feature requirements (federated learning, AI/ML)
- You SHOULD consider future scalability and growth
- You MUST document all assumptions and constraints
- You MUST NOT proceed if critical requirements are missing

### 2. Cloud Provider Selection and Strategy
Evaluate and recommend appropriate cloud provider strategy.

**Constraints:**
- You MUST evaluate cloud providers based on requirements
- You SHOULD consider multi-cloud or hybrid cloud strategies
- You MUST assess geographic and data residency requirements
- You MUST analyze cost structures and optimization opportunities
- You SHOULD plan for cloud migration strategy
- You MUST consider vendor lock-in risks
- You MUST provide rationale for provider selection
- You MAY suggest multiple provider options for comparison

### 3. High-Level Architecture Design
Design overall system architecture and component interactions.

**Constraints:**
- You MUST design overall system architecture
- You MUST define component boundaries and interactions
- You MUST plan data flows and integration patterns
- You MUST design network architecture and security zones
- You MUST plan for high availability and disaster recovery
- You SHOULD consider scalability and performance requirements
- You MUST ensure architecture supports compliance requirements
- You MUST create architecture diagrams using Mermaid or similar tools

### 4. Detailed Component Design
Design detailed architecture for each component layer.

**Constraints:**

#### Data Storage Layer
- You MUST design data lake architecture (S3, Blob Storage, GCS)
- You MUST design data warehouse design (Redshift, Synapse, BigQuery)
- You MUST select appropriate database technologies (RDS, DynamoDB, Cosmos DB)
- You MUST design data catalog and metadata management
- You MUST consider data lifecycle management
- You SHOULD implement data encryption at rest and in transit

#### Compute Layer
- You MUST plan batch processing architecture (EC2, VMs, Compute Engine)
- You MUST design serverless computing (Lambda, Functions, Cloud Functions)
- You MUST select container platforms (EKS, AKS, GKE)
- You MUST design high-performance computing setup if needed
- You SHOULD consider auto-scaling and cost optimization

#### API and Integration Layer
- You MUST design API gateway configuration
- You MUST implement microservices architecture
- You MUST design event-driven patterns
- You MUST plan third-party integrations
- You MUST implement API security (WAF, rate limiting)
- You SHOULD consider API versioning and lifecycle management

#### Identity and Access Management
- You MUST design authentication mechanisms (Cognito, AD, Identity Platform)
- You MUST implement authorization (IAM, RBAC)
- You MUST plan directory services integration
- You MUST implement multi-factor authentication
- You MUST design role-based access control
- You SHOULD consider single sign-on (SSO) requirements

#### Security and Compliance
- You MUST implement defense-in-depth security strategy
- You MUST design encryption and key management (KMS, Key Vault, Cloud KMS)
- You MUST plan network security (VPC, VNet, firewalls)
- You MUST design monitoring and logging (CloudTrail, Monitor, Operations Suite)
- You MUST implement compliance controls
- You MUST design incident response and monitoring

### 5. FAIR Principles Implementation
Design architecture to support FAIR principles.

**Constraints:**

#### Findable
- You MUST design comprehensive metadata catalog services
- You MUST implement search and discovery capabilities
- You MUST assign persistent identifiers and DOIs
- You SHOULD implement metadata standards (Dublin Core, schema.org)

#### Accessible
- You MUST implement standard APIs with clear authentication
- You MUST design access control mechanisms
- You MUST implement rate limiting and throttling
- You SHOULD support multiple data access protocols

#### Interoperable
- You MUST adopt data standards (CDISC, FHIR, OMOP)
- You MUST implement API standards (OpenAPI, GraphQL)
- You MUST support data exchange formats (Dataset-JSON, Parquet)
- You SHOULD ensure semantic interoperability

#### Reusable
- You MUST provide clear data dictionaries and documentation
- You MUST include licensing and usage terms
- You MUST implement provenance and lineage tracking
- You SHOULD support data citation and attribution

### 6. Security and Compliance Design
Implement comprehensive security and compliance controls.

**Constraints:**
- You MUST implement defense-in-depth security strategy
- You MUST design encryption and key management
- You MUST plan network security and isolation
- You MUST implement compliance controls and audit logging
- You MUST design data classification and handling procedures
- You MUST implement incident response and monitoring
- You MUST ensure compliance with HIPAA, GDPR, GxP
- You SHOULD design for continuous compliance monitoring

### 7. Cost Optimization and Planning
Analyze costs and implement optimization strategies.

**Constraints:**
- You MUST analyze cost structures by component
- You MUST implement cost optimization strategies
- You MUST plan for reserved instances and savings plans
- You MUST design for cost monitoring and optimization
- You MUST create total cost of ownership (TCO) analysis
- You SHOULD provide cost forecasting and budget planning
- You MUST implement cost alerts and controls

### 8. Documentation and Delivery
Generate comprehensive architecture documentation.

**Constraints:**
- You MUST generate comprehensive architecture document
- You MUST create architecture diagrams using Mermaid or similar tools
- You MUST provide implementation roadmap with phases
- You MUST include cost estimates and risk assessment
- You MUST document best practices and operational guidelines
- You SHOULD provide migration strategy and timeline
- You MUST include references to relevant standards and guidelines
- You MUST ensure documentation is clear and actionable

## Examples

### Basic Clinical Data Sharing Platform
**Input:**

```json
{
"platform_requirements": {
"data_volume": {
"current_size_tb": 5,
"projected_growth_tb_per_year": 2,
"data_types": ["clinical_trials"]
},
"user_scale": {
"concurrent_users": 50,
"total_users": 500,
"user_types": ["researchers", "clinicians"]
},
"security_requirements": {
"compliance_standards": ["HIPAA", "21 CFR Part 11"],
"data_classification": ["PHI", "de-identified"],
"audit_requirements": true
},
"performance_requirements": {
"availability_sla": "99.5%",
"max_latency_ms": 1000,
"throughput_requests_per_second": 500
},
"advanced_features": {
"federated_learning": false,
"confidential_computing": false,
"ai_ml_capabilities": false
}
},
"cloud_provider": "AWS"
}
```

**Output:** Comprehensive architecture design including:
- High-level architecture diagram with component interactions
- Detailed component design for data storage, compute, API, and security layers
- AWS service recommendations (S3, RDS, API Gateway, Cognito, etc.)
- Security and compliance implementation plan
- Cost estimates and optimization strategies
- Implementation roadmap with phases

### Advanced Multi-Cloud Platform with AI/ML
**Input:**

```json
{
"platform_requirements": {
"data_volume": {
"current_size_tb": 50,
"projected_growth_tb_per_year": 20,
"data_types": ["clinical_trials", "real_world_evidence", "genomics", "imaging"]
},
"user_scale": {
"concurrent_users": 500,
"total_users": 5000,
"user_types": ["researchers", "clinicians", "data_scientists", "external_partners", "ai_researchers"]
},
"security_requirements": {
"compliance_standards": ["HIPAA", "GDPR", "21 CFR Part 11", "ISO 27001"],
"data_classification": ["PHI", "PII", "genomic_data", "de-identified"],
"audit_requirements": true
},
"performance_requirements": {
"availability_sla": "99.99%",
"max_latency_ms": 200,
"throughput_requests_per_second": 5000
},
"advanced_features": {
"federated_learning": true,
"confidential_computing": true,
"ai_ml_capabilities": true
}
},
"cloud_provider": "multi-cloud",
"geographic_requirements": {
"data_residency": ["US", "EU", "APAC"],
"multi_region_deployment": true
}
}
```

**Output:** Advanced multi-cloud architecture design including:
- Multi-cloud strategy with service selection for each provider
- Advanced security architecture with zero-trust principles
- AI/ML platform design with federated learning capabilities
- Confidential computing implementation
- Global deployment strategy with data residency compliance
- Comprehensive cost optimization and TCO analysis
- Detailed implementation roadmap with risk mitigation

## Troubleshooting

### Issue: Requirements are incomplete or ambiguous
**Solution:** Ask clarifying questions, provide multiple architecture options, document assumptions, engage stakeholders for clarification.

### Issue: Security and compliance requirements conflict with performance
**Solution:** Implement balanced approach, use performance monitoring, optimize security controls, document trade-offs.

### Issue: Budget constraints limit architectural options
**Solution:** Prioritize features, implement phased approach, use cost-optimized services, provide cost-benefit analysis.

### Issue: Integration with legacy systems is complex
**Solution:** Design integration patterns, use API gateways, plan for gradual migration, implement adapter patterns.

### Issue: Multi-cloud management complexity
**Solution:** Use cloud management platforms, implement consistent standards, design for portability, provide operational guidance.

## Quality Assurance

### Pre-Execution Checks
- Verify platform requirements are complete and valid
- Confirm security and compliance requirements are clearly defined
- Validate that performance requirements are realistic
- Check that integration needs are well understood
- Ensure geographic and regulatory requirements are identified

### Post-Execution Validation
- Verify architecture addresses all requirements
- Confirm security and compliance controls are comprehensive
- Validate that FAIR principles are properly implemented
- Ensure cost estimates are realistic and well-documented
- Check that implementation roadmap is achievable
- Validate that architecture diagrams are clear and accurate

### Documentation Requirements
- Maintain clear architecture documentation
- Include detailed diagrams and visual representations
- Document all assumptions and design decisions
- Provide comprehensive implementation guidance
- Include operational and maintenance considerations
- Ensure documentation is accessible to all stakeholders
- Provide references to relevant standards and best practices
