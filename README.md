# Azure App Configuration Import Action

GitHub Action that imports application keys and feature flags into Azure App Configuration.

## When to use

The action is useful to import key-values and feature flags in an App Configuration instance dynamically, without the need to redeploy or restart an application.

## Prerequisites

* An Azure service principal added as a secret on your GitHub repository. For more info, see [Create a service principal and add it to GitHub secret](https://docs.microsoft.com/azure/developer/github/connect-from-azure#create-a-service-principal-and-add-it-to-github-secret).
* Existing Azure App Configuration instance. For more info, see [Create an App Configuration store](https://docs.microsoft.com/en-us/azure/azure-app-configuration/quickstart-aspnet-core-app?tabs=core5x#create-an-app-configuration-store).

## Example Usage

### **Import all keys and feature flags from a file**

```yml
steps:
  - name: Azure Login
    uses: azure/login@v1
    with:
      creds: ${{ secrets.AZURE_CREDENTIALS }}

  - name: Import from config file
    uses: Azure/app-configuration-import-action@v1.0.0
    with:
      name: myAppConfigurationName
      path: myFilePath
      # prefix: myPrefix
      # label: myLabel
```

## Inputs

| Name | Description | Required |
| --- | --- | --- |
| `name` | App Configuration name. | false |
| `path` | Configuration file path. Accepted file extensions: `.json`, `.properties`, `.yml` and `.yaml`. | false |
| `prefix` | Prefix to be appended to the front of imported keys. | false |
| `label` | Label to be assigned to imported key-values and feature flags. | false |

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft 
trademarks or logos is subject to and must follow 
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
