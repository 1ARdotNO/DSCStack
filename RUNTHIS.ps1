



#input your owna variables, especially password
$SQLSAPassword="Topsecret!"
$SQLDbName="DSC"
$SQLServerName="localhost"
$SQLDir="E:\sqlpullserver"  #Use double \\
$PullServerDir="E:\pullserver"
$PullServerPort="8080"





#Create SQL connection string from user variables
$SQLString="Provider=SQLNCLI11;Server=$SQLServerName;Database=$SQLDbName;User ID=SA;Password=$SQLSAPassword;Initial Catalog=master;"


#Check if docker is installed, if not run install.

#
#
#



#Create docker container for sql
docker run --isolation hyperv -d -p 1433:1433 -e sa_password=$SQLSAPassword -e ACCEPT_EULA=Y -v $SQLDir`:c:\temp\ -e attach_dbs="[{'dbName':'$SQLDbName','dbFiles':['c:\\temp\\$SQLDbName.mdf','c:\\temp\\$SQLDbName`_log.ldf']}]" microsoft/mssql-server-windows-express


#create docker container for DSC
docker run --isolation hyperv `
    -p $PullServerPort`:8080 `
    -v $PullServerDir`:C:\pullserver `
    -e ConnectionString="$SQLString" `
    --rm `
    -d einar/dscstack