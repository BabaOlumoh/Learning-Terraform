#!/bin/bash

date=$(date '+%d%m%Y')

RESOURCE_GROUP_NAME=terraform-lab-yt
STORAGE_ACCOUNT_NAME=terraformlab$date
CONTAINER_NAME=tfstate-blob
LOCATION=eastus

#Create resource group
az group create --name $RESOURCE_GROUP_NAME --location eastus

# Create storage account
az storage account create -n $STORAGE_ACCOUNT_NAME -g $RESOURCE_GROUP_NAME -l $LOCATION --sku Standard_LRS

# Create blob container
az storage container create -n $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME
