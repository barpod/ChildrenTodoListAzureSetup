
set RG_NAME=%1
set ACC_NAME=%2
set APP_NAME=%3
set DB_NAME=%4
set PLAN=%APP_NAME%Plan

call az appservice plan create -g %RG_NAME% -n %PLAN% --sku FREE --location westeurope
call az webapp create -g %RG_NAME% -p %PLAN% -n %APP_NAME% --runtime "DOTNET|5.0"

FOR /F "tokens=*" %%g IN ('call az cosmosdb keys list --resource-group %RG_NAME% --name %ACC_NAME% --query primaryMasterKey') do (SET PRIMARY_MASTER_KEY=%%g)

az webapp config appsettings set -g %RG_NAME% -n %APP_NAME% --settings CosmosDbKey=%PRIMARY_MASTER_KEY%
az webapp config appsettings set -g %RG_NAME% -n %APP_NAME% --settings CosmosDbUri=https://%ACC_NAME%.documents.azure.com:443/
az webapp config appsettings set -g %RG_NAME% -n %APP_NAME% --settings CosmosDbName=%DB_NAME%
