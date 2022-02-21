param (
        $Input
)

$WebhookURL = "$ENV:ENV_WEBHOOK_URL"
$Message = @"
{ "message" : "$Input" }
"@

Invoke-WebRequest -Uri $WebhookURL -Method POST -Body $Message
