
rem RG_NAME=children-todo-list-dev-rg 
rem set APP_NAME=ChildrenTodoListDev
set RG_NAME=children-todo-list-test-test-rg 
set COSMOS_DB_ACC_NAME=child-todo-list-cosmos-db-dev 
set APP_NAME=ChildrenTodoListTestTest

call az group create -l westeurope -n %RG_NAME%

rem call setup_cosmos_db.bat %RG_NAME% %COSMOS_DB_ACC_NAME%
call setup_rest_api.bat %RG_NAME% %COSMOS_DB_ACC_NAME% %APP_NAME%
