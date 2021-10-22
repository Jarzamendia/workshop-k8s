---
title: "Hands-On 1.2"
chapter: true
weight: 1
---




# Dicas importantes

Limites para Docker Pull!

```powershell
$TOKEN = (Invoke-WebRequest -Uri "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | ConvertFrom-Json).token

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add('Authorization',"Bearer $TOKEN")

$Limits = Invoke-WebRequest -uri "https://registry-1.docker.io/v2/ratelimitpreview/test/manifests/latest" -Headers $headers

Write-Host ("Limites totais: " + $Limits.Headers.'ratelimit-limit')
Write-Host ("Limites sobrando: " + $Limits.Headers.'ratelimit-remaining')
```

HTTP/1.1 429 Too Many Requests
Cache-Control: no-cache
Connection: close
Content-Type: application/json
{
  "errors": [{
      "code": "TOOMANYREQUESTS",
      "message": "You have reached your pull rate limit. You may increase the limit by authenticating and upgrading: https://www.docker.com/increase-rate-limit"
  }]
}
```