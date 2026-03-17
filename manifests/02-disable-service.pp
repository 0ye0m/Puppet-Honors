# Level 2: Stop and disable Windows Search service (WSearch)
service { 'WSearch':
  ensure => 'stopped',
  enable => false,
}
