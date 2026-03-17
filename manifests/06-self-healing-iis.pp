# Boss Level: Deploy and self-heal IIS website (requires puppetlabs-iis module)
iis_feature { 'Web-Server':
  ensure => present,
}

service { 'W3SVC':
  ensure => 'running',
  enable => true,
  require => Iis_feature['Web-Server'],
}

file { 'C:/inetpub/wwwroot/index.html':
  ensure  => file,
  content => '<html><body><h1>Welcome to Your Self-Healing Website</h1></body></html>',
  require => Service['W3SVC'],
}
