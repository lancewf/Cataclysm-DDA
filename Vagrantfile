require 'open-uri'
require 'json'

$setup = <<SCRIPT
apt-get update
apt-get --assume-yes install libncurses5-dev libncursesw5-dev build-essential
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.provision "shell", inline: $setup
end
