IP = "192.168.66.101"
NAME = "playground"

Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/trusty64"
    config.vm.network :private_network, ip: IP

    config.vm.provider :virtualbox do |virtualbox|
        virtualbox.customize ["modifyvm", :id, "--name", NAME]
        virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        virtualbox.customize ["modifyvm", :id, "--memory", "4096"]
        virtualbox.customize ["setextradata", :id, "--VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
    end

    config.ssh.username = "vagrant"
    config.ssh.shell = "bash -l"
    config.ssh.keep_alive = true
    config.ssh.forward_agent = false
    config.ssh.forward_x11 = false

    config.vagrant.host = :detect

    config.vm.provision "shell", inline: "apt-get install dos2unix -y && dos2unix /vagrant/provision/* && /vagrant/provision/install"

end
