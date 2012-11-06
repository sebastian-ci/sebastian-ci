Vagrant::Config.run do |config|
  config.vm.box = "precise64"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['chef/cookbooks', 'chef/cookbooks-custom']
    chef.roles_path = 'chef/roles'
    chef.data_bags_path = 'chef/data_bags'

    chef.add_role 'worker'

    # You may also specify custom JSON attributes:
    # chef.json = { :mysql_password => "foo" }
  end
end
