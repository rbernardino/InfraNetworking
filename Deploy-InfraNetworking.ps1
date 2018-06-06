break

#region Deploy the onprem network resource
  $location = 'Southeast Asia'
  $resourceGroupName = 'onPremNetwork'
  $resourceDeploymentName = 'onPremNetwork-deployment'
  $templateFile = '.\AzRmTemplates\onprem.network.json'
  $templateParameterFile = '.\AzRmTemplates\onprem.network.parameters.json'

  New-AzureRmJsonTemplateDeployment `
    -ResourceGroupName $resourceGroupName `
    -DeploymentName $resourceDeploymentName `
    -Location $location `
    -Path $templateFile `
    -TemplateParameterFile $templateParameterFile `
    -Verbose -Force

  # Cleanup if needed
  Remove-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Force -Verbose
#endregion

#region Deploy the azure (websphere) network resource
$location = 'East US'
$resourceGroupName = 'azureNetwork'
$resourceDeploymentName = 'azureNetwork-deployment'
$templateFile = '.\AzRmTemplates\azure.network.json'
$templateParameterFile = '.\AzRmTemplates\azure.network.parameters.json'

New-AzureRmJsonTemplateDeployment `
  -ResourceGroupName $resourceGroupName `
  -DeploymentName $resourceDeploymentName `
  -Location $location `
  -Path $templateFile `
  -TemplateParameterFile $templateParameterFile `
  -Verbose -Force

# Cleanup if needed
Remove-AzureRmResourceGroup `
  -Name $resourceGroupName `
  -Force -Verbose
#endregion
