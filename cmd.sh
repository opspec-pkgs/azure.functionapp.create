#!/usr/bin/env sh

### begin login
loginCmd='az login -u "$loginId" -p "$loginSecret"'

# handle opts
if [ "$loginTenantId" != " " ]; then
    loginCmd=$(printf "%s --tenant %s" "$loginCmd" "$loginTenantId")
fi

case "$loginType" in
    "user")
        echo "logging in as user"
        ;;
    "sp")
        echo "logging in as service principal"
        loginCmd=$(printf "%s --service-principal" "$loginCmd")
        ;;
esac
eval "$loginCmd" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"
### end login

echo "checking for existing function app"
if [ "$(az functionapp show --name "$name" --resource-group "$resourceGroup")" != "" ]
then
  echo "found existing function app"
else
  createCmd='az functionapp create'
  createCmd=$(printf "%s --name %s" "$createCmd" "$name")
  createCmd=$(printf "%s --resource-group %s" "$createCmd" "$resourceGroup")
  createCmd=$(printf "%s --storage-account %s" "$createCmd" "$storageAccount")
  createCmd=$(printf "%s --deployment-source-branch %s" "$createCmd" "$deploymentSourceBranch")

  # handle opts
  if [ "$isLocalGitEnabled" == "true" ]; then
    createCmd=$(printf "%s --deployment-local-git" "$createCmd")
  fi

  if [ "$deploymentSourceUrl" != " " ]; then
    createCmd=$(printf "%s --deployment-source-url %s" "$createCmd" "$deploymentSourceUrl")
  fi

  if [ "$appServicePlan" != " " ]; then
    createCmd=$(printf "%s --plan %s" "$createCmd" "$appServicePlan")
  else
    createCmd=$(printf "%s --consumption-plan-location %s" "$createCmd" "$consumptionPlanLocation")
  fi

  echo "creating function app"
  eval "$createCmd"
fi
