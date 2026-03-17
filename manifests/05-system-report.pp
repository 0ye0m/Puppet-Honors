# Level 5: Generate system information report using facts
file { 'C:/Puppet-Lab/system_info.txt':
  ensure  => file,
  content => @("SYSTEM_REPORT")
Operating System: ${facts['os']['name']} ${facts['os']['release']['full']}
Processor Count:  ${facts['processors']['count']}
Total Memory:     ${facts['memory']['system']['total']}
IP Address:       ${facts['networking']['ip']}
| SYSTEM_REPORT
}
