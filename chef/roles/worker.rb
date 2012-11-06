name "worker"

description "Sebastian CI Worker"

run_list(
  "recipe[apt]",
  "recipe[build-essential]",
  "recipe[git]",
  "recipe[percona-install]",
  "recipe[percona-install::server]",
  "recipe[redisio::install]",
  "recipe[rvm::system]",
  "recipe[rvm::gem_package]",
  "recipe[rvm::vagrant]"
)

default_attributes(
  'rvm' => {
    'default_ruby'  => 'ruby-1.9.3-p286',
    'rubies'        => ['ruby-1.9.3-p286'],

    'version'       => '1.16.16', # rvm 1.16.17 is broken - https://github.com/fnichol/chef-rvm/issues/133
    'branch'        => 'none'
  },
  'authorization' => {
    'sudo' => {
      'users' => ['vagrant']
    }
  }
)
