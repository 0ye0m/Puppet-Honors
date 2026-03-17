# Level 1: Create directory and welcome file
file { 'C:/Puppet-Lab':
  ensure => 'directory',
}

file { 'C:/Puppet-Lab/welcome.txt':
  ensure  => file,
  content => "Welcome to Your Puppet Lab!\nManaged by Puppet on ${facts['time']['day']}\n",
}
