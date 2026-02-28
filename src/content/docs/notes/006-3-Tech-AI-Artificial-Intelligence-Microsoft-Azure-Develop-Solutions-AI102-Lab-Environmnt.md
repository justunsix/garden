---
description: Low cost lab environment in Azure for Azure AI learning
filetags: ":artificial-intelligence:ai:microsoft:azure:ai102:epubnote:"
id: 59f08c23-93b2-4fd3-a669-30c4d79877fc
title: AI-102 Azure AI Development Lab Environment
---

# Lab overview

Try to use free or lowest pricing tier of resources and less extra
resources for a development period of 1-2 weeks. All resources are
removed after.

Possible resources:

- Azure AI multi‑service resource at lowest tier
- Azure OpenAI resource using GPT‑nano/mini models
- Azure AI Search

Avoid APIM, private networking, fine‑tuning, and resources with fixed
monthly hosting.

# Example Terraform deployment

Deployment is not tested, but captures deployment information for use
during a first manual creation.

``` hcl

# ---
# providers.tf
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# variables.tf
variable "location" {
  description = "Azure region for all resources."
  type        = string
  # or prefer canadacentral
  default     = "eastus"
}

variable "name_prefix" {
  description = "Short prefix used in resource names (letters/numbers only recommended)."
  type        = string
  default     = "aiwk"
}

variable "tags" {
  description = "Tags applied to all resources."
  type        = map(string)
  default     = {
    purpose   = "ai-week-devtest"
    lifecycle = "ephemeral"
  }
}

variable "create_openai" {
  description = "Whether to create the Azure OpenAI (cognitive account kind=OpenAI)."
  type        = bool
  default     = true
}

variable "create_openai_deployment" {
  description = "Whether to create an Azure OpenAI model deployment (requires model availability/quota)."
  type        = bool
  default     = false
}

variable "openai_deployment_name" {
  description = "Deployment name used within Azure OpenAI."
  type        = string
  default     = "devtest"
}

variable "openai_model_name" {
  description = "Model name for azurerm_cognitive_deployment (varies by region). Example: gpt-4o-mini."
  type        = string
  default     = "gpt-4o-mini"
}

variable "openai_model_version" {
  description = "Optional model version. Leave empty to use default."
  type        = string
  default     = ""
}

variable "openai_deployment_sku" {
  description = "Deployment SKU name for the model deployment. Examples: GlobalStandard, Standard, DataZoneStandard."
  type        = string
  default     = "GlobalStandard"
}

# ---
# main.tf
resource "random_string" "suffix" {
  length  = 6
  upper   = false
  numeric = true
  special = false
}

locals {
  # Keep names short to fit Azure naming limits
  suffix      = random_string.suffix.result
  rg_name     = "${var.name_prefix}-rg-${local.suffix}"
  ai_name     = "${var.name_prefix}aisvc${local.suffix}"
  openai_name = "${var.name_prefix}aoai${local.suffix}"
  search_name = "${var.name_prefix}srch${local.suffix}"
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

# -----------------------------
# Azure AI multi-service resource
# kind = "AIServices" gives the multi-service “superset” access pattern
# sku_name = "F0" is the free tier SKU for many Azure AI services when available
# -----------------------------
resource "azurerm_cognitive_account" "ai_services" {
  name                = local.ai_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  kind     = "AIServices"
  sku_name = "F0"

  public_network_access_enabled = true
  local_auth_enabled            = true

  tags = var.tags
}

# -----------------------------
# Azure OpenAI resource
# Note: Azure OpenAI uses azurerm_cognitive_account with kind = "OpenAI"
# sku_name is commonly S0 (standard), as there's no general F0 free tier
# -----------------------------
resource "azurerm_cognitive_account" "openai" {
  count               = var.create_openai ? 1 : 0
  name                = local.openai_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  kind     = "OpenAI"
  sku_name = "S0"

  # Useful for SDKs that assume https://<subdomain>.openai.azure.com/
  # (Optional, but convenient; changing later forces replacement)
  custom_subdomain_name = lower(local.openai_name)

  public_network_access_enabled = true
  local_auth_enabled            = true

  tags = var.tags
}

# Optional: Azure OpenAI model deployment
# Enable with: create_openai_deployment = true
# If model isn't available in the region or quota isn't enabled, apply will fail.
resource "azurerm_cognitive_deployment" "openai_deployment" {
  count = (var.create_openai && var.create_openai_deployment) ? 1 : 0

  name                 = var.openai_deployment_name
  cognitive_account_id = azurerm_cognitive_account.openai[0].id

  model {
    format  = "OpenAI"
    name    = var.openai_model_name
    version = var.openai_model_version != "" ? var.openai_model_version : null
  }

  sku {
    # Possible values include Standard, DataZoneStandard, GlobalStandard, etc.
    name = var.openai_deployment_sku
  }
}

# -----------------------------
# Azure AI Search (free tier)
# sku = "free" provisions in shared cluster and is ideal for small tests/tutorials.
# -----------------------------
resource "azurerm_search_service" "search" {
  name                = lower(local.search_name)
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku = "free"

  public_network_access_enabled = true
  local_authentication_enabled  = true

  tags = var.tags
}

# ---
# outputs.tf
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "ai_services_endpoint" {
  description = "Endpoint for the Azure AI multi-service (AIServices) account."
  value       = azurerm_cognitive_account.ai_services.endpoint
}

output "ai_services_primary_key" {
  description = "Primary key for the Azure AI multi-service account (local auth must be enabled)."
  value       = azurerm_cognitive_account.ai_services.primary_access_key
  sensitive   = true
}

output "search_service_name" {
  value = azurerm_search_service.search.name
}

output "search_service_endpoint" {
  value = "https://${azurerm_search_service.search.name}.search.windows.net"
}

output "search_admin_key_primary" {
  value     = azurerm_search_service.search.primary_key
  sensitive = true
}

output "openai_endpoint" {
  description = "Endpoint for the Azure OpenAI account (if created)."
  value       = var.create_openai ? azurerm_cognitive_account.openai[0].endpoint : null
}

output "openai_primary_key" {
  description = "Primary key for the Azure OpenAI account (if created)."
  value       = var.create_openai ? azurerm_cognitive_account.openai[0].primary_access_key : null
  sensitive   = true
}

output "openai_deployment_name" {
  description = "OpenAI deployment name (if created)."
  value       = (var.create_openai && var.create_openai_deployment) ? azurerm_cognitive_deployment.openai_deployment[0].name : null
}

# ---
# terraform.tfvars.example
location = "eastus"
name_prefix = "aiwk"

tags = {
  purpose   = "ai-week-devtest"
  owner     = "yourname"
  expires   = "2026-02-13"
}

# OpenAI resource on/off
create_openai = true

# Only enable if you know the model is available in the region + you have quota
create_openai_deployment = false
openai_deployment_name   = "devtest"
openai_model_name        = "gpt-4o-mini"
openai_model_version     = ""
openai_deployment_sku    = "GlobalStandard"

```
