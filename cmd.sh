#!/usr/bin/env sh

echo "logging in to azure"
az login -u "$azureUsername" -p "$azurePassword" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"

echo "checking for exiting function app"
if [ "$(az functionapp show --name "$name" --resource-group "$resourceGroup")" != "" ]
then
  echo "found exiting function app"
else
  echo "function app not found"
  echo "creating function app"
  az functionapp create \
    --name "$name" \
    --resource-group "$resourceGroup" \
    --storage-account "$storageAccount" \
    --consumption-plan-location "$consumptionPlanLocation"
fi
