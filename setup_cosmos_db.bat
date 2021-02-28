


echo Creating CosmosDB account and db with name=%1 in resource group=%2
set ACC_NAME=%1
set RG_NAME=%2
set DB_NAME=ChildrenTodoListDb
call az cosmosdb create --name %ACC_NAME% --resource-group %RG_NAME% --enable-free-tier
call az cosmosdb sql database create --account-name %ACC_NAME% --resource-group %RG_NAME% --name %DB_NAME%

call az cosmosdb sql container create --account-name %ACC_NAME% --database-name %DB_NAME% --name Children --resource-group %RG_NAME% --partition-key-path "/Id"
call az cosmosdb sql container create --account-name %ACC_NAME% --database-name %DB_NAME% --name TodoListTasks --resource-group %RG_NAME% --partition-key-path "/Id"
