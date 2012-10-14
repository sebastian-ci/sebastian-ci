name "sebastian_run_migrations"
description "Run db:migrate on demand for sebastian"
override_attributes( "apps" => { "sebastian" => { "production" => { "run_migrations" => true } } })
