# Overview
We will build data solution to enable these features:
- Data ingestion
- Data warehouse (or lakehouse)
- Data visualisation
- DataOps
- Data governance
- AI / ML Integration
- Streaming Data Analytics/Realtime Data Processing
- Data Governance

# Technologies
- Azure Synapse
- Azure Data Factory
- Azure Machine Learning
- Azure Data Lake Gen 2
- Power BI
- Azure Data Explorer
- Azure Databricks
- Azure EventHub
- Azure Streaming Data Analytics
- Azure Purview

# Get started
## Introduction

Data solution template will help you quickly create a new modern data solution on Azure which includes the following services:
- Azure Data Factory
- Azure Synapse
- Azure Data Lake Gen2
- Azure Machine Learning
- Power BI
- Azure Keyvault
- Azure Databricks
- Azure Purview
- Azure EventHub
- Azure Streaming Analytics

By using the StepOne CLI, you can easily pick up what services to use and it will generate the lean architecture depending on selected services.

## Generate project structure

To get started with Data Solution template, firstly you can download the latest version of StepOne CLI here [TODO].

```bash
~/Project ❯ stepone-kit data create project1
? Please pick preset: Manully select features  [Use arrows to move, space to select, <right> to all, <left> to none, type to filter]
  [x]  Azure Data Factory
  [x]  Azure Synapse
  [x]  Azure Stream Analytics
  [x]  Azure Databricks
  [x]  Azure Purview
  [x]  Azure Machine Learning

Created file: Project1/README.md 
Created file: Project1/datafactory/dataset/ds_db_params.json 
...
```

It will generate the project structure at folder **DataProjectABC**. Go to the project and you will see the project structure as follow:

```bash
.
├── README.md
├── azureml
│   └── modules
│       ├── core
│       └── predictive_maintenance
├── build
│   ├── adf-build-pipeline-v1.yml
│   ├── adf-build-pipelines.yml
│   ├── adf-setup-new-env-pipeline.json
│   ├── package.json
│   ├── synapse-build-pipeline.yml
│   └── synapse-setup-new-env-pipeline.json
├── datafactory
│   ├── dataset
│   │   ├── ds_allowable_running.json
│   │   ├── ds_datalake_load.json
│   │   ├── ds_db_params.json
│   │   ├── ds_db_src_oncloud.json
│   │   ├── ds_db_src_onprem.json
│   │   ├── ds_job_config.json
│   │   ├── ds_pipeline_param.json
│   │   └── ds_watermarktable.json
│   ├── linkedService
│   │   ├── PowerBIWorkspace.json
│   │   ├── ls_datalake.json
│   │   ├── ls_dbAudit.json
│   │   ├── ls_dbsource_oncloud.json
│   │   ├── ls_dbsource_onpremise.json
│   │   └── ls_keyvault.json
│   └── pipeline
│       ├── adf_FullLoad_OnCloud.json
│       ├── adf_FullLoad_OnPremise.json
│       ├── adf_GenericLoadDB_OnCloud.json
│       ├── adf_GenericLoadDB_OnPremise.json
│       ├── adf_IncrementalLoad_OnCloud.json
│       ├── adf_IncrementalLoad_OnPremise.json
│       ├── adf_WriteErrorLog.json
│       └── adf_WriteLog.json
├── docs
│   ├── README.md
│   ├── adf.drawio
│   ├── adf_setup_new_environment.md
│   ├── assets
│   │   ├── adf_data_pipeline.png
│   │   ├── new_release_pipeline_s1.png
│   │   ├── new_release_pipeline_s2.png
│   │   ├── new_release_pipeline_s3.png
│   │   ├── new_release_pipeline_s4.png
│   │   ├── new_release_pipeline_s5.png
│   │   ├── new_release_pipeline_s6.png
│   │   ├── new_release_pipeline_s7.png
│   │   ├── new_release_pipeline_s8.png
│   │   └── new_release_pipeline_s9.png
│   └── aure_data_factory_data_pipeline.md
├── infra
│   ├── envs
│   │   ├── dev
│   │   ├── prod
│   │   ├── qa
│   │   └── stg
│   └── modules
│       ├── azureml
│       ├── datafactory
│       ├── lake
│       ├── resource-group
│       ├── sqlserver
│       ├── storage
│       ├── synapse
│       └── vault
└── synapse
    ├── dataset
    │   ├── ds_allowable_running.json
    │   ├── ds_datalake_load.json
    │   ├── ds_db_params.json
    │   ├── ds_db_src_oncloud.json
    │   ├── ds_db_src_onprem.json
    │   ├── ds_job_config.json
    │   ├── ds_pipeline_param.json
    │   └── ds_watermarktable.json
    ├── integrationRuntime
    │   └── igrMyLocal.json
    ├── linkedService
    │   ├── PowerBIWorkspace.json
    │   ├── ls_datalake.json
    │   ├── ls_dbAudit.json
    │   ├── ls_dbsource_oncloud.json
    │   ├── ls_dbsource_onpremise.json
    │   └── ls_keyvault.json
    ├── notebook
    │   ├── Load_DimCategory.json
    │   ├── Load_DimDate.json
    │   ├── Load_DimEvent.json
    │   ├── Load_DimEvent_Dedicated_SQL.json
    │   ├── Load_DimUser.json
    │   ├── Load_DimUser_Dedicated_SQL.json
    │   ├── Load_DimVenue.json
    │   ├── Load_DimVenue_Dedicated_SQL.json
    │   ├── Load_FactSales.json
    │   ├── Load_FactSales_Dedicated_SQL.json
    │   └── nb_create_dw_schema.json
    ├── pipeline
    │   ├── adf_FullLoad_OnCloud.json
    │   ├── adf_FullLoad_OnPremise.json
    │   ├── adf_GenericLoadDB_OnCloud.json
    │   ├── adf_GenericLoadDB_OnPremise.json
    │   ├── adf_IncrementalLoad_OnCloud.json
    │   ├── adf_IncrementalLoad_OnPremise.json
    │   ├── adf_Load_DimCategory.json
    │   ├── adf_Load_DimCategory_SQL_Dedicated.json
    │   ├── adf_Load_DimDate.json
    │   ├── adf_Load_DimEvent.json
    │   ├── adf_Load_DimEvent_SQL_Dedicated.json
    │   ├── adf_Load_DimUser.json
    │   ├── adf_Load_DimUser_SQL_Dedicated.json
    │   ├── adf_Load_DimVenue.json
    │   ├── adf_Load_DimVenue_SQL_Dedicated.json
    │   ├── adf_Load_FactSales_Dedicated_SQL.json
    │   ├── adf_Load_SalesFact.json
    │   ├── adf_MasterLoad.json
    │   ├── adf_MasterLoad_SQL_Dedicated.json
    │   ├── adf_WriteErrorLog.json
    │   └── adf_WriteLog.json
    ├── powerbireport
    │   └── Tickit_Dashboard.pbix
    └── sqlscript
        ├── PowerBIModel.json
        ├── Structure_External_Table_DW_Dedicated.json
        ├── dim_category.json
        ├── dim_event.json
        ├── dim_user.json
        ├── dim_venue.json
        ├── fact_sales.json
        ├── usp_Insert_Dim_Category.json
        ├── usp_Insert_Dim_Event.json
        ├── usp_Insert_Dim_User.json
        ├── usp_Insert_Dim_Venue.json
        └── usp_Insert_Fact_Sales.json
```

# Setup project
## Pre-requisites

After you have created a project structure by using StepOne CLI, you're now ready to provision the Azure services to be ready to deploy the data solution.

To be fully aware about what Azure services will be created, please see the list below. Noted that it may include partially or fully list below which depends on what you have selected options while you created using the StepOne CLI:

- Azure KeyVault
- Azure Storage (Azure Data Lake Gen2)
- Azure Data Factory
- Azure Synapse
- Azure Spark pool
- Azure Machine Learning
- Azure Kubernetes Service
- Azure Application Insights
- Azure SQL Database
- Azure Databricks
- Azure Purview
- Azure EventHub
- Azure Streaming Analytics

You have to install the following software at your machine with an Azure subscription:

- Azure Subscription
- [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/azure-get-started)
- [Install Azure CLI](https://learn.hashicorp.com/tutorials/terraform/azure-build?in=terraform/azure-get-started)

Your subscription may not enable some services such as Azure Data Factory, Azure Synapse and you will need to enable these before provision the infrastructure.

## Provision the infrastructure

### Step 1:
Firstly, you need update Terraform variables so that we can launch the environment with expected parameters, open the file ```ProjectABC/infra/envs/dev/variable.tf```

```
// Resource group name
variable "resource_group_name" {
  default = "projectabc"
}

// Default Resource location
variable "azure_location" {
  default = "Southeast Asia"
}
// and update all other configurations
```

Update database credentials password value, these value will be used by terraform when provision pipline audit database, synape workspace, and the connection string secrets in the keyvault.
```bash
cp infra/envs/dev/credentials.auto.tfvars.example infra/envs/dev/credentials.auto.tfvars

# update the vault in the credentials.auto.tfvars file
```

### Step 2: Login to subscription, create resource group

Login to Azure using Azure CLI, choose suitable subscription and create resource group. 

```
$ az login
$ az account set --subscription=[YOUR_SUBSCRIPTION_ID]
$ az group create -l [YOUR_LOCATION] -n [YOUR_RESOURCE_GROUP_NAME]
# the resource group name must be identical with the name you've configured in Terraform variables

```

### Step 3: Then provision the infrastructure using Terraform.

```
$ cd Project1/infra/envs/dev
$ terraform init
$ terraform apply
```

It will take a while to create all of these services on Azure. There will be some common problems you may face (please refer to common issues for more details). If every services are created, you will be able see them on Azure as follow:

### Step 4: Create data pipeline config database schema.
```bash
$ cd Project1/envs/dev
$ stepone-kit data db migrate 
or 
$ stepone-kit data db migrate --demo
```

### Step 5: Import data pipline artinfact

<Check document on wiki>

# Members
- Phi Huynh (Project Manager)
- Vinh Phan (Data Architect)
- Hung Nguyen (AI Lead)
- Phuc Ngo (SWAT)
- Long Hoang (Senior Data Engineer Manager)
- Binh Tran (Data Scientist)
- Toan Dang (Data Solution)

# Technologies
- Azure Synapse
- Azure Data Factory
- Azure Machine Learning
- Azure Data Lake Gen 2
- Power BI
- Azure Data Explorer
- Azure Databricks
- Azure Stream Analytics
- Delta Lake
- Azure EventHub
- Azure Key Vault