name "worker"

description "Sebastian CI Worker"

run_list(
  "recipe[apt]",
  "recipe[git]",
  "recipe[rbenv]",
  "recipe[application]"
)

override_attributes(
  'unicorn' => { 'port' => '80', 'worker_timeout' => 300 }
)
