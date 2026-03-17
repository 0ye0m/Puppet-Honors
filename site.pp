node default {
  # Level 1: Create directory and welcome file
  file { 'C:/Puppet-Lab':
    ensure => directory,
  }

  file { 'C:/Puppet-Lab/welcome.txt':
    ensure  => file,
    content => "Welcome to Your Puppet Lab!\nManaged by Puppet on ${facts['time']['day']}\n",
    require => File['C:/Puppet-Lab'],
  }

  # Level 2: Disable Windows Search service (WSearch)
  service { 'WSearch':
    ensure => stopped,
    enable => false,
  }

  # Level 3: Registry key and value (requires puppetlabs-registry module)
  registry_key { 'HKLM\Software\MyCompany':
    ensure => present,
  }

  registry_value { 'HKLM\Software\MyCompany\DeploymentID':
    ensure => present,
    type   => string,
    data   => '2025-03-17',
    require => Registry_key['HKLM\Software\MyCompany'],
  }

  # Level 4: Install 7-Zip silently via Chocolatey (requires puppetlabs-chocolatey module)
  include chocolatey

  package { '7zip':
    ensure   => installed,
    provider => chocolatey,
    require  => Class['chocolatey'],
  }

  # Level 5: Generate system information report using facts
  file { 'C:/Puppet-Lab/system_info.txt':
    ensure  => file,
    content => "Operating System: ${facts['os']['name']} ${facts['os']['release']['full']}\nProcessor Count: ${facts['processors']['count']}\nTotal Memory: ${facts['memory']['system']['total']}\nIP Address: ${facts['networking']['ip']}\n",
  }

  # Boss Level: Deploy IIS website with self-healing
  iis_feature { 'Web-Server':
    ensure => present,
  }

  file { 'C:/inetpub/wwwroot/index.html':
    ensure  => file,
    content => '<h1>Welcome to Your Self-Healing Website</h1><p>This site is managed by Puppet and will auto-heal if changed.</p>',
    require => Iis_feature['Web-Server'],
  }

  service { 'W3SVC':
    ensure  => running,
    enable  => true,
    require => Iis_feature['Web-Server'],
  }
}
