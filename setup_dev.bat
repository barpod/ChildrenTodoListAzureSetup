
rem RG_NAME=children-todo-list-dev-rg 
rem set APP_NAME=ChildrenTodoListDev
set RG_NAME=children-todo-list-dev-rg 
set COSMOS_DB_ACC_NAME=child-todo-list-cosmos-db-dev
set APP_NAME=ChildrenTodoListDev
set DB_NAME=ChildrenTodoListDbDev

call az group create -l westeurope -n %RG_NAME%

call setup_cosmos_db.bat %RG_NAME% %COSMOS_DB_ACC_NAME% %DB_NAME%
call setup_rest_api.bat %RG_NAME% %COSMOS_DB_ACC_NAME% %APP_NAME% %DB_NAME%
