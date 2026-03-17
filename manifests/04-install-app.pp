# Level 4: Install 7-Zip silently via Chocolatey (requires puppetlabs-chocolatey module)
package { '7zip':
  ensure   => installed,
  provider => 'chocolatey',
}
