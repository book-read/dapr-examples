## create azure eventhub
```bash
# create eventhub namespace
az eventhubs namespace create --name <namespace name> --resource-group <resource group name> -l <region, such as westus>
# create eventhub
az eventhubs eventhub create --name <eventhub name> --resource-group <resource group name> --namespace-name <namespace name>
# get eventhub connstr
az eventhubs namespace authorization-rule keys list --resource-group <resource group name> --namespace-name <namespace name> --name RootManageSharedAccessKey
```
