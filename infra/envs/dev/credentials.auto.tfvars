// On-premise login user password
// This password will be stored on the Azure Keyvault
on-premise-password = "dummy@123"

// DB user name of the audit database
db_username = "sqladminuser"

// DB password of the audit database
db_password = "studygroup@123"

# // DB connection string of the pipeline parameters
# azuresql_connection_string = "Server=tcp:ntdatateam-azuredb-dev.database.windows.net,1433;Initial Catalog=PipelineParameters;Persist Security Info=False;User ID=sqladminuser;Password=studygroup@123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"

# // local database source connection string
# localdbconn_connection_string = "Data Source=localhost,1433;Network Library=DBMSSOCN;Initial Catalog=tickit;User ID=sa;Password=studygroup@123;"

# // Connection string to the sample tickit sale database
clouddbconn_connection_string = "Server=tcp:ntdatateam-azuredb-dev.database.windows.net,1433;Initial Catalog=tickit;Persist Security Info=False;User ID=sqladminuser;Password=Nashtech123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"

// DB username of the builtin synapse database
sql_administrator_login = "sqladminuser"

// DB password of the builtin synapse database
sql_administrator_login_password = "studygroup@123"

// DB username of the builtin synapse database
dbr_sql_administrator_login = "sqladminuser"
// DB password of the builtin synapse database
dbr_tickitPassword = "studygroup@123"
dbr_auditPassword = "studygroup@123"
dbr_secret_scope = "dsdatabrick-scope"
# sku_tier = "premium"
dbr_clientid = "e402526f-7cec-403d-a575-2f20da2938e5"
dbr_clientsecret = "LoE8Q~3TTz3BXN1oYTI5GB4nqkzTNpCifvU.3bmf"
dbr_clientobjectid = "0c5e9886-5037-4e4f-a19e-240361f3d4cd"
dbr_tenantid = "039815dd-00ae-48d7-adbb-090e93dcbc01"
# mysql_connection_string = "Server=127.0.0.1;Database=humhub;Uid=root;Pwd=mysql;"
dbr_apipredicttoken = "Oh5ZudrP4QRLzMtWnxRqeG335qkKjj8U"