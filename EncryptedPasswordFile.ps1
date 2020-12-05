<# Set and encrypt credentials to file using default method #>
## NOTE:  In a production environment, it is recommended to have a service account used solely for creating and running the encryption and automation scripts.

# storing credentials to a file
$credential = Get-Credential
$credential.Password | ConvertFrom-SecureString | Set-Content -Path "C:\\bin\\Misc\\credentials.txt"

# retrieving credentials 
$securepw = Get-Content -Path "C:\\bin\\Misc\\credentials.txt" | ConvertTo-SecureString
$SecureCredentials = New-Object Management.Automation.PSCredential ("USERNAME", $securepw)

# using credentials
Start-Process -Credential $creds cmd /c "net session" 

