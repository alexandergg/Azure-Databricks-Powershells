
#!/bin/bash
# This script configures the environment to user Azure ML Workspace in databricks

############## START CONFIGURATION #################
# Provide the required *AzureML* workspace information
resourceGroupLocation = "" # example: westus2
subscriptionId = "" # example: bcb65f42-f234-4bff-91cf-9ef816cd9936
resourceGroupName = "" # example: dev-rg
amlWorkspaceName = "" # example: myazuremlws

#Service principal

tenantId = ""
clientId = ""
secret = ""


# Optional config directory
configLocation="/databricks/aml/config.json"
############### END CONFIGURATION #################


# Drop the workspace configuration on the cluster
sudo touch $configLocation
sudo echo {\"subscription_id\": \"${subscriptionId}\", \"resource_group\": \"${resourceGroupName}\", \"workspace_name\": \"${amlWorkspaceName}\"} > $configLocation

# Set the MLflow Tracking URI

token=$(curl -X POST https://login.microsoftonline.com/$tenantId/oauth2/token -d "grant_type=client_credentials&resource=https%3A%2F%2Fmanagement.azure.com%2F&client_id=$clientId&client_secret=$secret" | python3 -c "import sys, json; print(json.load(sys.stdin)['access_token'])")

trackingUri="'azureml://${resourceGroupLocation}.experiments.azureml.net/history/v1.0/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.MachineLearningServices/workspaces/${amlWorkspaceName}?auth-type=ServicePrincipalAuthentication&auth=${token}&cloud-type=AzureCloud'"

sudo echo export MLFLOW_TRACKING_URI=${trackingUri} >> /databricks/spark/conf/spark-env.sh
