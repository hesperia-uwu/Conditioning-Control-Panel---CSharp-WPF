$heart = [char]::ConvertFromUtf32(0x2764) + [char]::ConvertFromUtf32(0xFE0F)
$lock = [char]::ConvertFromUtf32(0x1F512)

$message = "Thanks to Desiree for the avatar/personalities idea! Shes Such a Good Girl - v5.3.1 is out! " + $heart + $lock

$body = @{
    message = $message
    admin_token = "ae66d472d012a3b42f9991d65d0e1bc473c61fac3985057ddb20d18f567dc996"
} | ConvertTo-Json -Compress

$utf8Bytes = [System.Text.Encoding]::UTF8.GetBytes($body)

$response = Invoke-RestMethod -Uri "https://codebambi-proxy.vercel.app/config/marquee" -Method Post -ContentType "application/json; charset=utf-8" -Body $utf8Bytes

$response | ConvertTo-Json
