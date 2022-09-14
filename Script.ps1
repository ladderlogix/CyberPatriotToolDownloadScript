#$zipFile = "https://drive.google.com/uc?export=download&id=1D48LSmtMrPUrsuehqYZJDLqdFqZMuik-"
#Invoke-WebRequest -Uri $zipFile -OutFile "$($env:TEMP)\VMWare.exe"

#set protocol to tls version 1.2
“[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12”

#turning off the progress bar
$ProgressPreference = 'SilentlyContinue'

#Download the Virus Warning into _tmp.txt
Invoke-WebRequest -Uri "https://drive.google.com/uc?export=download&id=1D48LSmtMrPUrsuehqYZJDLqdFqZMuik-" -OutFile "_tmp.txt" -SessionVariable googleDriveSession

#Get confirmation code from _tmp.txt
$searchString = Select-String -Path "_tmp.txt" -Pattern "confirm=" $searchString -match "confirm=(?<content>.*)&id=" $confirmCode = $matches['content']

#Delete _tmp.txt
Remove-Item "_tmp.txt"

#Download the real file
Invoke-WebRequest -Uri "https://drive.google.com/uc?export=download&confirm=${confirmCode}&id=1D48LSmtMrPUrsuehqYZJDLqdFqZMuik-" -OutFile "$($env:TEMP)\VMWare.exe" -WebSession $googleDriveSession