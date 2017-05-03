<#
This get's all of the Vmss Instances in a resource group and triggers the instance update.
#>

Set-StrictMode -version 1

Get-AzureRmVmss -ResourceGroupName $resourceGroupName `
    |% {
        $vmssName = $_.Name;
        
        # You can also loop to get some subset of instances to apply the update.
        $instanceIds = (Get-AzureRmVmssVM -ResourceGroupName $resourceGroupName -VMScaleSetName $vmssName).InstanceId;
        Update-AzureRmVmssInstance -ResourceGroupName $resourceGroupName -VMScaleSetName $vmssName -InstanceId $instanceIds
    }
