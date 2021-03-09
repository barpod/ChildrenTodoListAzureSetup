
echo Creating CosmosDB account %1 and db %3 in resource group=%2
set RG_NAME=%1
set ACC_NAME=%2
set DB_NAME=%3
call az cosmosdb create --name %ACC_NAME% --resource-group %RG_NAME% --enable-free-tier
call az cosmosdb sql database create --account-name %ACC_NAME% --resource-group %RG_NAME% --name %DB_NAME%

call az cosmosdb sql container create --account-name %ACC_NAME% --database-name %DB_NAME% --name Children --resource-group %RG_NAME% --partition-key-path "/Id"
call az cosmosdb sql container create --account-name %ACC_NAME% --database-name %DB_NAME% --name TodoListTasks --resource-group %RG_NAME% --partition-key-path "/Id"
