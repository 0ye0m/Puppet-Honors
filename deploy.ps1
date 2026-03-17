param(
    [Parameter(Mandatory)]
    [ValidateSet('01','02','03','04','05','boss')]
    [string]$Level
)

switch ($Level) {
    '01'   { $manifest = '01-create-file.pp' }
    '02'   { $manifest = '02-disable-service.pp' }
    '03'   { $manifest = '03-set-registry.pp' }
    '04'   { $manifest = '04-install-app.pp' }
    '05'   { $manifest = '05-system-report.pp' }
    'boss' { $manifest = '06-self-healing-iis.pp' }
}

Write-Host "Copying $manifest to site.pp and triggering Puppet agent..."
Copy-Item -Path ".\manifests\$manifest" -Destination ".\site.pp" -Force
& puppet agent -t