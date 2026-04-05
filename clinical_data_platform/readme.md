# Clinical Data Analysis Platform
## 临床数据分析交互式平台
---
## 📋 目录
- [项目概述](#项目概述)
- [系统架构](#系统架构)
- [文件夹结构](#文件夹结构)
- [核心组件详解](#核心组件详解)
  - [16个Skills详解](#16个skills详解)
  - [16个SOPs详解](#16个sops详解)
  - [Project Manager详解](#project-manager详解)
  - [配置文件详解](#配置文件详解)
- [Skills能力矩阵](#skills能力矩阵)
- [SOPs工作流程矩阵](#sops工作流程矩阵)
- [工作流模板](#工作流模板)
- [用户交互模板](#用户交互模板)
- [快速开始](#快速开始)
- [问题定位指南](#问题定位指南)
- [开发指南](#开发指南)
- [最佳实践](#最佳实践)
- [附录](#附录)
---
## 项目概述
### 项目名称
**Clinical Data Analysis Platform (CDAP)** - 临床数据分析交互式平台
### 项目目标
构建一个**智能化、模块化、可扩展**的临床数据分析平台，通过16个核心Skills和16个标准化SOPs，覆盖从试验设计到监管提交的完整临床数据分析工作流程。
### 核心价值
#### 1. 智能化
- **AI驱动**：集成4个Intelligence Skills，提供智能决策支持
- **自动化**：自动化重复性任务，提高效率
- **自适应**：根据用户需求和监管要求动态调整
#### 2. 模块化
- **松耦合**：16个Skills独立工作，可单独使用
- **可组合**：通过SOPs和工作流模板灵活组合
- **易维护**：模块化设计便于维护和升级
#### 3. 可扩展
- **开放架构**：支持添加新Skills和SOPs
- **标准接口**：统一的输入输出格式
- **插件化**：支持第三方集成
#### 4. 合规性
- **监管导向**：内置FDA、EMA、PMDA、NMPA等监管要求
- **CDISC标准**：支持SDTM、ADaM等CDISC标准
- **审计追踪**：完整的操作日志和审计轨迹
### 适用场景
| 场景 | 描述 | 涉及Skills | 涉及SOPs |
|------|------|-----------|---------|
| **试验设计** | 临床试验方案设计和统计咨询 | SK001, SK013, SK015 | SOP001 |
| **SAP开发** | 统计分析计划开发和代码生成 | SK001, SK002, SK014 | SOP002 |
| **CDISC合规** | CDISC数据集设计和验证 | SK004, SK005, SK013, SK016 | SOP004, SOP005 |
| **结果审核** | 统计结果审核和解释 | SK006, SK015, SK016 | SOP006 |
| **合规验证** | SAP合规性和统计验证 | SK007, SK013, SK015, SK016 | SOP007 |
| **数据QC** | 临床数据质量控制和审核 | SK008, SK009 | SOP008 |
| **可视化** | 交互式仪表板开发 | SK003, SK010, SK014 | SOP003, SOP010 |
| **提交包** | 监管提交包组装 | SK011, SK013, SK016 | SOP011 |
| **数据分析** | 临床试验数据分析 | SK012 | SOP012 |
| **文档验证** | 多文档一致性检查 | SK017 | SOP017 |
---
## 系统架构
### 整体架构
```
┌─────────────────────────────────────────────────────────────┐
│                     用户界面层 (UI Layer)                     │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐       │
│  │  Web Portal  │  │  API Gateway │  │  CLI Tool    │       │
│  └──────────────┘  └──────────────┘  └──────────────┘       │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│                  项目管理层 (Project Manager)                 │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  • 工作流编排  • 参数管理  • 用户交互  • 透明度管理  │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│                    工作流引擎层 (Workflow Engine)              │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐       │
│  │  Workflow    │  │  SOP         │  │  Skill       │       │
│  │  Templates   │  │  Executor    │  │  Executor    │       │
│  └──────────────┘  └──────────────┘  └──────────────┘       │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│                    核心能力层 (Core Capabilities)              │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  Intelligence Skills (4)  │  Core Skills (12)        │   │
│  │  • 监管指南智能  • 技术趋势智能                      │   │
│  │  • 统计方法智能  • 合规评估智能                      │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│                    数据存储层 (Data Storage)                   │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐       │
│  │  PostgreSQL  │  │  File System │  │  Object Store│       │
│  └──────────────┘  └──────────────┘  └──────────────┘       │
└─────────────────────────────────────────────────────────────┘
```
### 核心组件
#### 1. Project Manager (项目管理者)
- **职责**：协调所有Skills和SOPs的执行
- **功能**：
  - 工作流编排
  - 参数管理
  - 用户交互管理
  - 透明度保证
  - 错误处理
- **配置文件**：`config/project-manager.yaml`
#### 2. Workflow Engine (工作流引擎)
- **职责**：执行预定义的工作流模板
- **功能**：
  - 工作流实例化
  - 任务调度
  - 依赖管理
  - 并行执行
  - 状态跟踪
- **配置文件**：`config/workflow-templates.yaml`
#### 3. SOP Executor (SOP执行器)
- **职责**：执行标准操作流程
- **功能**：
  - 步骤解析
  - 约束验证
  - Skill调用
  - 用户交互
  - 结果记录
- **文件位置**：`clinical_data_sops/*.sop.md`
#### 4. Skill Executor (Skill执行器)
- **职责**：执行具体的临床数据分析任务
- **功能**：
  - 参数验证
  - 任务执行
  - 结果生成
  - 错误处理
- **文件位置**：`clinical_data_skills/*.yaml`
#### 5. User Interaction Service (用户交互服务)
- **职责**：管理用户交互界面
- **功能**：
  - 模板渲染
  - 输入收集
  - 确认处理
  - 通知发送
- **配置文件**：`config/user-interaction-templates.yaml`
### 工作流程
```
用户请求
    ↓
Project Manager接收请求
    ↓
检查工作流模板
    ↓
实例化工作流
    ↓
执行SOP步骤
    ↓
调用Skill
    ↓
需要用户交互？
    ├─ 是 → 显示交互模板 → 等待用户确认 → 继续执行
    └─ 否 → 继续执行
    ↓
生成结果
    ↓
记录审计日志
    ↓
返回结果给用户
```
---
## 文件夹结构
### 完整目录树
```
clinical_data_platform/
│
├── clinical_data_skills/              # Skills文件夹 (16个.yaml文件)
│   ├── SK001-trial-design-statistical-consult.yaml
│   ├── SK002-sap-to-analysis-code-skeleton.yaml
│   ├── SK003-interactive-dashboard-framework-gen.yaml
│   ├── SK004-cdisc-dataset-design.yaml
│   ├── SK005-cdisc-validation-rule-application.yaml
│   ├── SK006-statistical-results-review-interpret.yaml
│   ├── SK007-sap-compliance-statistical-validation.yaml
│   ├── SK008-clinical-data-qc-review.yaml
│   ├── SK009-data-transformation-logic.yaml
│   ├── SK010-tfl-generation-framework.yaml
│   ├── SK011-submission-package-assembly.yaml
│   ├── SK012-clinical-trial-data-analyst.yaml
│   ├── SK013-regulatory-guidelines-intelligence.yaml
│   ├── SK014-technology-trends-intelligence.yaml
│   ├── SK015-statistical-methodology-intelligence.yaml
│   ├── SK016-compliance-assessment-guideline-alignment.yaml
│   └── SK017-doc-consistency-check-multi.yaml
│
├── clinical_data_sops/                # SOPs文件夹 (16个.sop.md文件)
│   ├── SOP001-trial-design-statistical-consult.sop.md
│   ├── SOP002-sap-to-analysis-code-skeleton.sop.md
│   ├── SOP003-interactive-dashboard-framework-gen.sop.md
│   ├── SOP004-cdisc-dataset-design.sop.md
│   ├── SOP005-cdisc-validation-rule-application.sop.md
│   ├── SOP006-statistical-results-review-interpret.sop.md
│   ├── SOP007-sap-compliance-statistical-validation.sop.md
│   ├── SOP008-clinical-data-qc-review.sop.md
│   ├── SOP009-data-transformation-logic.sop.md
│   ├── SOP010-tfl-generation-framework.sop.md
│   ├── SOP011-submission-package-assembly.sop.md
│   ├── SOP012-clinical-trial-data-analyst.sop.md
│   ├── SOP013-regulatory-guidelines-intelligence.sop.md
│   ├── SOP014-technology-trends-intelligence.sop.md
│   ├── SOP015-statistical-methodology-intelligence.sop.md
│   ├── SOP016-compliance-assessment-guideline-alignment.sop.md
│   └── SOP017-doc-consistency-check-multi.sop.md
│
├── config/                            # 配置文件夹
│   ├── project-manager.yaml          # Project Manager配置
│   ├── workflow-templates.yaml       # 工作流模板配置
│   ├── user-interaction-templates.yaml  # 用户交互模板配置
│   └── system-settings.yaml          # 系统设置
│
├── backend/                           # 后端代码 (待实现)
│   ├── services/
│   │   ├── projectManager.py
│   │   ├── workflowEngine.py
│   │   ├── sopExecutor.py
│   │   ├── skillExecutor.py
│   │   └── userInteractionService.py
│   ├── models/
│   ├── controllers/
│   └── utils/
│
├── frontend/                          # 前端代码 (待实现)
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   └── services/
│   └── public/
│
├── docs/                              # 文档文件夹
│   ├── api/
│   ├── user-guide/
│   └── developer-guide/
│
├── tests/                             # 测试文件夹
│   ├── unit/
│   ├── integration/
│   └── e2e/
│
├── logs/                              # 日志文件夹
│   ├── audit/
│   ├── error/
│   └── performance/
│
├── data/                              # 数据文件夹
│   ├── input/
│   ├── output/
│   └── temp/
│
├── .trae/                             # 配置文件夹
│   └── ...
│
├── README.md                          # 项目文档 (本文件)
├── LICENSE                            # 许可证
├── requirements.txt                   # Python依赖
└── setup.py                           # 安装脚本
```
### 文件夹用途说明
| 文件夹 | 用途 | 包含内容 |
|--------|------|---------|
| `clinical_data_skills/` | 存放所有Skill定义文件 | 16个.yaml文件，定义每个Skill的功能、参数、输出 |
| `clinical_data_sops/` | 存放所有SOP定义文件 | 16个.sop.md文件，定义每个SOP的步骤、约束、调用关系 |
| `config/` | 存放系统配置文件 | Project Manager、工作流模板、用户交互模板等配置 |
| `backend/` | 后端代码 | Python服务、模型、控制器等 |
| `frontend/` | 前端代码 | React组件、页面、服务等 |
| `docs/` | 项目文档 | API文档、用户指南、开发者指南 |
| `tests/` | 测试代码 | 单元测试、集成测试、端到端测试 |
| `logs/` | 日志文件 | 审计日志、错误日志、性能日志 |
| `data/` | 数据文件 | 输入数据、输出数据、临时数据 |
| `.trae/` | 系统配置 | 平台特定配置 |
---
## 核心组件详解
### 16个Skills详解
#### Intelligence Skills (智能Skills - 4个)
##### SK013: regulatory-guidelines-intelligence (监管指南智能)
- **文件**：`clinical_data_skills/SK013-regulatory-guidelines-intelligence.yaml`
- **功能**：检索最新的监管指南和标准
- **目标**：
  - 提供监管指南的版本信息
  - 管理版本接受期
  - 要求用户确认版本选择
- **输入参数**：
  - `guideline_type` (必需)：指南类型（ICH E9, CDISC SDTMIG等）
  - `regulatory_agency` (可选)：监管机构（FDA, EMA, PMDA, NMPA）
- **输出**：
  - 可用版本列表
  - 每个版本的详细信息（发布日期、接受期、状态）
  - 监管接受度评估
- **使用场景**：
  - 试验设计前确认指南版本
  - CDISC数据集设计前确认标准版本
  - 统计分析前确认方法学版本
- **被调用**：SK001, SK004, SK005, SK006, SK007, SK011
- **对应SOP**：SOP013
##### SK014: technology-trends-intelligence (技术趋势智能)
- **文件**：`clinical_data_skills/SK014-technology-trends-intelligence.yaml`
- **功能**：检索最新的技术趋势和最佳实践
- **目标**：
  - 提供技术栈的版本信息
  - 管理版本兼容性
  - 要求用户确认技术选择
- **输入参数**：
  - `technology_domain` (必需)：技术领域（编程语言、框架、工具）
  - `application_context` (可选)：应用场景
- **输出**：
  - 可用技术栈列表
  - 每个技术栈的详细信息（版本、特性、兼容性）
  - 推荐和最佳实践
- **使用场景**：
  - 代码生成前确认技术栈
  - 仪表板开发前确认前端/后端技术
  - 系统集成前确认兼容性
- **被调用**：SK002, SK003
- **对应SOP**：SOP014
##### SK015: statistical-methodology-intelligence (统计方法智能)
- **文件**：`clinical_data_skills/SK015-statistical-methodology-intelligence.yaml`
- **功能**：检索最新的统计方法学发展
- **目标**：
  - 评估统计方法的监管接受度
  - 提供方法学推荐
  - 比较不同方法的优缺点
- **输入参数**：
  - `methodology_domain` (必需)：方法学领域（统计方法、试验设计等）
  - `application_context` (必需)：应用场景
  - `regulatory_agency` (可选)：监管机构
- **输出**：
  - 相关方法学列表
  - 每个方法的监管接受度
  - 方法比较和推荐
- **使用场景**：
  - 试验设计时选择统计方法
  - 结果审核时评估方法学合规性
  - SAP开发时确定分析方法
- **被调用**：SK001, SK006, SK007
- **对应SOP**：SOP015
##### SK016: compliance-assessment-guideline-alignment (合规评估指南对齐)
- **文件**：`clinical_data_skills/SK016-compliance-assessment-guideline-alignment.yaml`
- **功能**：执行全面的合规性评估
- **目标**：
  - 评估监管、技术和方法学合规性
  - 提供差距分析和补救建议
  - 生成合规性报告
- **输入参数**：
  - `assessment_target` (必需)：评估目标（文档、数据集、分析等）
  - `target_content` (必需)：评估内容
  - `guideline_type` (必需)：指南类型
  - `regulatory_agency` (可选)：监管机构
- **输出**：
  - 合规性评估结果
  - 差距分析
  - 补救建议
  - 合规性报告
- **使用场景**：
  - CDISC数据集验证后评估合规性
  - 统计结果审核后评估合规性
  - 提交包组装前评估合规性
- **被调用**：SK004, SK005, SK006, SK007, SK011
- **对应SOP**：SOP016
#### Core Skills (核心Skills - 12个)
##### SK001: trial-design-statistical-consult (试验设计统计咨询)
- **文件**：`clinical_data_skills/SK001-trial-design-statistical-consult.yaml`
- **功能**：提供临床试验设计和统计咨询
- **目标**：
  - 设计试验方案
  - 确定样本量
  - 选择统计方法
  - 生成试验设计文档
- **输入参数**：
  - `guideline_version` (必需)：指南版本（需用户确认）
  - `regulatory_agency` (必需)：监管机构（需用户确认）
  - `trial_phase` (必需)：试验阶段
  - `trial_type` (可选)：试验类型
  - `therapeutic_area` (可选)：治疗领域
- **输出**：
  - 试验设计文档
  - 样本量计算结果
  - 统计方法推荐
  - 设计依据和理由
- **使用场景**：
  - 新试验设计
  - 试验方案修订
  - 监管咨询准备
- **调用Skills**：SK013, SK015
- **对应SOP**：SOP001
##### SK002: sap-to-analysis-code-skeleton (SAP到分析代码骨架)
- **文件**：`clinical_data_skills/SK002-sap-to-analysis-code-skeleton.yaml`
- **功能**：从SAP生成分析代码骨架
- **目标**：
  - 解析SAP文档
  - 生成分析代码框架
  - 确保代码与SAP一致
- **输入参数**：
  - `technology_stack` (必需)：技术栈（需用户确认）
  - `sap_document` (必需)：SAP文档
  - `output_language` (可选)：输出语言（Python, R, SAS）
- **输出**：
  - 分析代码骨架
  - 代码文档
  - 实现指南
- **使用场景**：
  - SAP开发完成后生成代码
  - 代码标准化
  - 加速分析实施
- **调用Skills**：SK014
- **对应SOP**：SOP002
##### SK003: interactive-dashboard-framework-gen (交互式仪表板框架生成)
- **文件**：`clinical_data_skills/SK003-interactive-dashboard-framework-gen.yaml`
- **功能**：生成交互式仪表板框架
- **目标**：
  - 设计仪表板架构
  - 生成前端/后端代码
  - 集成数据可视化
- **输入参数**：
  - `frontend_technology` (必需)：前端技术（需用户确认）
  - `backend_technology` (必需)：后端技术（需用户确认）
  - `data_source` (必需)：数据源
  - `dashboard_requirements` (可选)：仪表板需求
- **输出**：
  - 仪表板框架代码
  - 部署配置
  - 使用文档
- **使用场景**：
  - 数据可视化需求
  - 实时监控需求
  - 交互式探索需求
- **调用Skills**：SK014
- **对应SOP**：SOP003
##### SK004: cdisc-dataset-design (CDISC数据集设计)
- **文件**：`clinical_data_skills/SK004-cdisc-dataset-design.yaml`
- **功能**：设计CDISC标准数据集
- **目标**：
  - 根据原始数据设计SDTM/ADaM数据集
  - 确保符合CDISC标准
  - 生成数据集规范
- **输入参数**：
  - `cdisc_standard_version` (必需)：CDISC标准版本（需用户确认）
  - `raw_data` (必需)：原始数据
  - `dataset_type` (可选)：数据集类型（SDTM, ADaM）
- **输出**：
  - CDISC数据集
  - 数据集规范文档
  - 变量映射表
- **使用场景**：
  - 原始数据转换为CDISC格式
  - 监管提交准备
  - 数据标准化
- **调用Skills**：SK013, SK016
- **对应SOP**：SOP004
##### SK005: cdisc-validation-rule-application (CDISC验证规则应用)
- **文件**：`clinical_data_skills/SK005-cdisc-validation-rule-application.yaml`
- **功能**：应用CDISC验证规则
- **目标**：
  - 验证CDISC数据集
  - 识别数据质量问题
  - 生成验证报告
- **输入参数**：
  - `cdisc_datasets` (必需)：CDISC数据集
  - `validation_rules` (可选)：验证规则
  - `cdisc_standard_version` (可选)：CDISC标准版本
- **输出**：
  - 验证结果
  - 数据质量问题列表
  - 修复建议
- **使用场景**：
  - CDISC数据集质量检查
  - 提交前验证
  - 数据清洗
- **调用Skills**：SK013, SK016
- **对应SOP**：SOP005
##### SK006: statistical-results-review-interpret (统计结果审核解释)
- **文件**：`clinical_data_skills/SK006-statistical-results-review-interpret.yaml`
- **功能**：审核和解释统计结果
- **目标**：
  - 审核统计结果
  - 解释结果含义
  - 评估结果可靠性
- **输入参数**：
  - `statistical_results` (必需)：统计结果
  - `guideline_version` (必需)：指南版本（需用户确认）
  - `review_criteria` (可选)：审核标准
- **输出**：
  - 结果审核报告
  - 结果解释
  - 可靠性评估
- **使用场景**：
  - 统计分析完成后审核结果
  - 监管咨询准备
  - 结果解释和沟通
- **调用Skills**：SK013, SK015, SK016
- **对应SOP**：SOP006
##### SK007: sap-compliance-statistical-validation (SAP合规性统计验证)
- **文件**：`clinical_data_skills/SK007-sap-compliance-statistical-validation.yaml`
- **功能**：验证SAP的合规性和统计方法
- **目标**：
  - 验证SAP符合监管要求
  - 验证统计方法正确性
  - 生成合规性报告
- **输入参数**：
  - `sap_document` (必需)：SAP文档
  - `statistical_results` (必需)：统计结果
  - `guideline_version` (必需)：指南版本（需用户确认）
- **输出**：
  - 合规性验证报告
  - 统计方法验证结果
  - 差距分析
- **使用场景**：
  - SAP开发完成后验证
  - 提交前合规检查
  - 监管咨询准备
- **调用Skills**：SK013, SK015, SK016
- **对应SOP**：SOP007
##### SK008: clinical-data-qc-review (临床数据QC审核)
- **文件**：`clinical_data_skills/SK008-clinical-data-qc-review.yaml`
- **功能**：执行临床数据质量控制审核
- **目标**：
  - 检查数据完整性
  - 检查数据一致性
  - 生成QC报告
- **输入参数**：
  - `clinical_data` (必需)：临床数据
  - `qc_criteria` (可选)：QC标准
- **输出**：
  - QC审核报告
  - 数据质量问题列表
  - 修复建议
- **使用场景**：
  - 数据收集后QC
  - 数据清洗
  - 数据质量监控
- **调用Skills**：无
- **对应SOP**：SOP008
##### SK009: data-transformation-logic (数据转换逻辑)
- **文件**：`clinical_data_skills/SK009-data-transformation-logic.yaml`
- **功能**：执行数据转换逻辑
- **目标**：
  - 转换数据格式
  - 应用转换规则
  - 生成转换后数据
- **输入参数**：
  - `raw_data` (必需)：原始数据
  - `transformation_rules` (可选)：转换规则
  - `output_format` (可选)：输出格式
- **输出**：
  - 转换后数据
  - 转换日志
  - 转换文档
- **使用场景**：
  - 数据格式转换
  - 数据清洗
  - 数据标准化
- **调用Skills**：无
- **对应SOP**：SOP009
##### SK010: tfl-generation-framework (TFL生成框架)
- **文件**：`clinical_data_skills/SK010-tfl-generation-framework.yaml`
- **功能**：生成Tables, Figures, and Listings (TFL)框架
- **目标**：
  - 设计TFL结构
  - 生成TFL代码
  - 确保TFL符合标准
- **输入参数**：
  - `tfl_requirements` (必需)：TFL需求
  - `data_source` (必需)：数据源
  - `output_format` (可选)：输出格式
- **输出**：
  - TFL代码
  - TFL规范文档
  - 生成指南
- **使用场景**：
  - 临床研究报告准备
  - 监管提交准备
  - 结果展示
- **调用Skills**：无
- **对应SOP**：SOP010
##### SK011: submission-package-assembly (提交包组装)
- **文件**：`clinical_data_skills/SK011-submission-package-assembly.yaml`
- **功能**：组装监管提交包
- **目标**：
  - 按监管要求组织文档
  - 验证提交包完整性
  - 生成提交包
- **输入参数**：
  - `regulatory_agency` (必需)：监管机构（需用户确认）
  - `submission_format` (必需)：提交格式（需用户确认）
  - `study_documents` (必需)：研究文档
- **输出**：
  - 提交包（ZIP/eCTD）
  - 提交清单
  - 验证报告
- **使用场景**：
  - 监管提交准备
  - 提交包验证
  - 提交流程管理
- **调用Skills**：SK013, SK016
- **对应SOP**：SOP011
##### SK012: clinical-trial-data-analyst (临床试验数据分析师)
- **文件**：`clinical_data_skills/SK012-clinical-trial-data-analyst.yaml`
- **功能**：执行全面的临床试验数据分析
- **目标**：
  - 执行统计分析
  - 生成分析结果
  - 提供数据洞察
- **输入参数**：
  - `clinical_data` (必需)：临床数据
  - `analysis_plan` (必需)：分析计划
  - `statistical_methods` (可选)：统计方法
- **输出**：
  - 分析结果
  - 分析报告
  - 数据洞察
- **使用场景**：
  - 临床试验数据分析
  - 数据探索
  - 结果解释
- **调用Skills**：无
- **对应SOP**：SOP012
##### SK017: doc-consistency-check-multi (多文档一致性检查)
- **文件**：`clinical_data_skills/SK017-doc-consistency-check-multi.yaml`
- **功能**：检查多个临床文档之间的一致性
- **目标**：
  - 识别文档间不一致
  - 提供修复建议
  - 生成一致性报告
- **输入参数**：
  - `documents` (必需)：文档列表
  - `check_rules` (可选)：检查规则
- **输出**：
  - 一致性检查报告
  - 不一致问题列表
  - 修复建议
- **使用场景**：
  - 多文档一致性验证
  - 文档质量控制
  - 提交前检查
- **调用Skills**：无
- **对应SOP**：SOP017
### 16个SOPs详解
#### SOP001: trial-design-statistical-consult.sop.md
- **文件**：`clinical_data_sops/SOP001-trial-design-statistical-consult.sop.md`
- **功能**：定义试验设计和统计咨询的标准流程
- **目标**：
  - 确保试验设计符合监管要求
  - 确保统计方法正确
  - 确保文档完整性
- **步骤**：
  1. 收集试验设计需求
  2. 调用监管指南智能确认版本
  3. 调用统计方法智能选择方法
  4. 执行试验设计
  5. 生成设计文档
  6. 用户确认
- **调用Skills**：SK001, SK013, SK015
- **输出**：试验设计文档
#### SOP002: sap-to-analysis-code-skeleton.sop.md
- **文件**：`clinical_data_sops/SOP002-sap-to-analysis-code-skeleton.sop.md`
- **功能**：定义从SAP生成代码骨架的标准流程
- **目标**：
  - 确保代码与SAP一致
  - 确保代码质量
  - 确保代码可维护性
- **步骤**：
  1. 解析SAP文档
  2. 调用技术趋势智能确认技术栈
  3. 生成代码骨架
  4. 验证代码质量
  5. 生成代码文档
  6. 用户确认
- **调用Skills**：SK002, SK014
- **输出**：分析代码骨架
#### SOP003: interactive-dashboard-framework-gen.sop.md
- **文件**：`clinical_data_sops/SOP003-interactive-dashboard-framework-gen.sop.md`
- **功能**：定义生成交互式仪表板框架的标准流程
- **目标**：
  - 确保仪表板功能完整
  - 确保技术栈合适
  - 确保用户体验良好
- **步骤**：
  1. 收集仪表板需求
  2. 调用技术趋势智能确认技术栈
  3. 设计仪表板架构
  4. 生成框架代码
  5. 集成数据可视化
  6. 用户确认
- **调用Skills**：SK003, SK014
- **输出**：仪表板框架
#### SOP004: cdisc-dataset-design.sop.md
- **文件**：`clinical_data_sops/SOP004-cdisc-dataset-design.sop.md`
- **功能**：定义CDISC数据集设计的标准流程
- **目标**：
  - 确保数据集符合CDISC标准
  - 确保数据质量
  - 确保文档完整性
- **步骤**：
  1. 调用监管指南智能确认标准版本
  2. 分析原始数据
  3. 设计数据集结构
  4. 生成数据集
  5. 生成规范文档
  6. 调用合规评估智能验证
  7. 用户确认
- **调用Skills**：SK004, SK013, SK016
- **输出**：CDISC数据集
#### SOP005: cdisc-validation-rule-application.sop.md
- **文件**：`clinical_data_sops/SOP005-cdisc-validation-rule-application.sop.md`
- **功能**：定义CDISC验证规则应用的标准流程
- **目标**：
  - 确保验证规则正确应用
  - 确保问题识别完整
  - 确保修复建议有效
