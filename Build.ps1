#Run this to build docker image PullserverContainer

#copying files and create directories
New-Item -Name PullServerContainer -ItemType Directory
New-Item -Name Modules -ItemType Directory -Path .\PullServerContainer
Install-Module -Name xPSDesiredStateConfiguration
Copy-Item -Path 'C:\Program Files\WindowsPowerShell\Modules\xPSDesiredStateConfiguration' -Destination .\PullServerContainer\Modules -Recurse -Force
Copy-Item .\Docker.ps1 .\PullServerContainer -Force
Copy-Item .\DockerMon.ps1 .\PullServerContainer -Force
Copy-Item .\sqlncli.msi .\PullServerContainer -Force
Copy-Item .\DockerFile .\PullServerContainer -Force

#Actual build
docker build .\PullServerContainer -t einar/dscstack:latest

#Cleanup
#Remove-Item .\PullServerContainer -Force

#Push image to docker hub
#docker login
#docker image push einar/dscstack
