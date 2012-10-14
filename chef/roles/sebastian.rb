name "sebastian"

description "Installs a Sebastian CI"

run_list(
  "recipe[apt]",
  "recipe[git]",
  "recipe[chef-client::delete_validation]",
  "recipe[chef-client::cron]",
  "recipe[rvm::ruby_193]",
  "recipe[application]"
)

override_attributes(
  'unicorn' => { 'port' => '80', 'worker_timeout' => 300 }
)
