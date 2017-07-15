# Problem statement
creates an azure function app (if doesn't already exist)

# Example usage

> note: in examples, VERSION represents a version of the azure.functionapp.create pkg

## install

```shell
opctl pkg install github.com/opspec-pkgs/azure.functionapp.create#VERSION
```

## run

```
opctl run github.com/opspec-pkgs/azure.functionapp.create#VERSION
```

## compose

```yaml
run:
  op:
    pkg: { ref: github.com/opspec-pkgs/azure.functionapp.create#VERSION }
    inputs: 
      subscriptionId:
      loginId:
      loginSecret:
      name:
      resourceGroup:
      storageAccount:
      # begin optional args
      appServicePlan:
      consumptionPlanLocation:
      deploymentSourceBranch:
      deploymentSourceUrl:
      isLocalGitEnabled:
      loginTenantId:
      loginType:
      # end optional args
```

# Support

join us on [![Slack](https://opspec-slackin.herokuapp.com/badge.svg)](https://opspec-slackin.herokuapp.com/)
or [open an issue](https://github.com/opspec-pkgs/azure.functionapp.create/issues)
