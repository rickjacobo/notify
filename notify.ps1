Param(
    [Parameter(mandatory=$true)]
    $WebhookURL,
    [Parameter(mandatory=$true)]
    $Message
)

$Message = @"
{ "message" : "$Message" }
"@
Invoke-WebRequest -Uri $WebhookURL -Method POST -Body $Message
