# control_repo

This is Exercise files for the below course 
https://www.linkedin.com/learning/learning-puppet


Steps to create our Sandbox for testing:

Download/Install Virtualbox & Vagrant
https://www.virtualbox.org/wiki/Downloads
https://www.vagrantup.com/downloads

Start with to creat the master.puppet.vm:
  vagrant up

SSH into it:
  vagrant ssh

Install Puppet:
  sudo su -
  rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
  yum install -y puppetserver vim git

Change the Allocate mem to puppet server, se we don't run out of memory on our test machine
  vim /etc/sysconfig/puppetserver
      JAVA_ARGS="-Xms512m -Xmx512m -Djruby.logger.class=com.puppetlabs.jruby_utils.jruby.Slf4jLogger"

Start puppet service and check the status:
  systemctl start puppetserver.service
  systemctl status puppetserver

Enable puppet service to start on reboot:
  systemctl enable puppetserver.service

Point the puppet agent to our master puppet node "in my case pointing to it self" by adding below lines:
  vim /etc/puppetlabs/puppet/puppet.conf
  
    [agent]
    server = master.puppet.vm

Install/Use ruby gem "in my case I'll use the version installed with puppet server and make it available to my user" by addeing below line:
  vim .bash_profile
    PATH=$PATH:/opt/puppetlabs/puppet/bin
  
  exec bash
  source .bash_profile
  

Install r10k that will be used to deply our code from GitHub to our server:
  gem install r10k


Create r10k config directory, and point it to our GitHub repo by adding the below lines "copy the line between ********* ":
  mkdir /etc/puppetlabs/r10k
  vim /etc/puppetlabs/r10k/r10k.yaml

*********
---
:cachedir: '/var/cache/r10k'

:sources:
        :my-org:
                remote: 'https://github.com/WhiteBeard38/control_repo.git'
                basedir: '/etc/puppetlabs/code/environments'
*********


Use the r10k to depoly our code:
  r10k deploy environment -p








