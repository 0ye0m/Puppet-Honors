# Level 3: Create registry key and value (requires puppetlabs-registry module)
registry_key { 'HKLM\Software\MyCompany':
  ensure => present,
}

registry_value { 'HKLM\Software\MyCompany\DeploymentID':
  ensure => present,
  type   => string,
  data   => '2025-03-17',
}
