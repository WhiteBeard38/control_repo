class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC8USqxPAxvud/pnjTF8k5sfi5JR3/Q5RNabPj2Q99NaJDt6cpLo/IUu0nrtBoLhrekVq+paEllXXxgWhk8TptU2UfCuABq4XfGL22Gk7HhJTccKGovTqa3oZJsRr6If1Kf78h8dwh9cenTuicFTG3GmVLdBNOwV6JJBXhFehWmPjHCXVrfhsX4ZzlImEBrllkvjKRg0F/YO6OmNdxRsvDwCRatZxvhttNhIUiF1vb1b/o1/mYmj4zcFBiSnR5Q5UTSTdPSSAnGqivXnLbLSA669VjfM6g06Lgc7fR7HPn2rUvlq57gtOE1XqRnyVlfbSoiVG0T+2dsUZ2OB2g+VBsr',
	}  
}
