# Cloudprem Infrastructure Parameters

This repository contains the configuration parameters for the Cloudprem infrastructure of each environment. Each directory represents one environment (e.g. development) and contains parameters such as the version of the infrastructure and the inputs for the Terraform stack.

The infrastructure is managed and deployed using [Terragrunt](https://terragrunt.gruntwork.io/docs/#features). By using terragrunt we are able to deploy the infrastructure to multiple environments, lock and version the infrastructure and keep Terraform code and state configuration DRY.

The outer [terragrunt.hcl](./live/terragrunt.hcl) file contains configurations for the backend state and locks. The [terragrunt.hcl](./live/development) files under each environment directory contain the parameters for that specific environment and the location and version of the Terraform code.

To deploy the stack, perform the following steps:

1. Initialize the backend and install the required providers and modules using terragrunt:

    ```console
    $ cd development
    $ terragrun init
    ```

    *Terragrunt will use the envrionment variable `AWS_REGION` to configure the S3/DynamoDB backend. If not specified will default to us-west-2*

2. Review the parameters in the [terragrunt.hcl](./development/terragrunt.hcl) file and execute the plan/apply

    ```console
    $ terragrunt apply
    ```

To delete the infrastructure for the environment execute terragrunt destroy

```console
$ terragrunt destroy
```

*(Note: Terragrunt uses the directory name as part of the key for the state file, don't use the same directory for different environments, that can cause issues with the Terraform state, instead copy the configuration file into a new directory)*

#### Pipelines

You can also deploy some pre-packaged CodePipeline pipelines to streamline the deployment process. For more information check the [Cloudprem Pipelines](https://github.com/nclouds/doz-cloudprem-pipeline) repository