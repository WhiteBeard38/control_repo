class minecraft {
  $url = 'https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar'
  $install_dir = '/opt/minecraft'
  
  file {'/opt/minecraft':
    ensure => directory,
  }
  file {"${$install_dir}/minecraft_server.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }
  package {'java':
    ensure => present,
  }
  file { "${$install_dir}/eula.txt":
    ensure => present,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service { 'minecraft':
    ensure => running,
    enable => true,
    require => [Package['java'],File["${$install_dir}/eula.txt"],File['/etc/systemd/system/minecraft.service']],
  }  
}
