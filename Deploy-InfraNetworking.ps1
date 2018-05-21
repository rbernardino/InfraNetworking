break

#region Deploy the lab environment network resource
  $location = 'Southeast Asia'
  $resourceGroupName = 'dscLabNetwork'
  $resourceDeploymentName = 'dscLabNetwork-deployment'
  $templateFile = '.\AzRmTemplates\dsclab.network.json'
  $templateParameterFile = '.\AzRmTemplates\dsclab.network.parameters.json'

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
