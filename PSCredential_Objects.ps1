# CONVERT PLAINTEXT TO ENCRYPTED PASSWORD
$username = 'username'
$password = 'password'
$securepw = ConvertTo-SecureString $password -AsPlainText -Force 
$SecureCredentials = New-Object Management.Automation.PSCredential ($username, $securepw)
$SecureCredentials | Export-Clixml ./creds.xml

# CONVERT ENCRYPTED PASSWORD TO PLAINTEXT
#(must be the same account as the one what encrypted the data)
$ImportedCreds= Import-Clixml -Path ./creds.xml
$UnsecurePassword = (New-Object PSCredential "Password", $ImportedCreds.Password).GetNetworkCredential().Password
$UnsecurePassword


# WITHOUT XML
$UnsecurePassword = (New-Object PSCredential "Password", $SecureCredentials.Password).GetNetworkCredential().Password
$UnsecurePassword
