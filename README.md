# problem statement
creates an azure function app (if doesn't already exist)

# example usage

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
      subscriptionId: ~
      azureUsername: ~
      azurePassword: ~
      name: ~
      resourceGroup: ~
      name: ~
```

