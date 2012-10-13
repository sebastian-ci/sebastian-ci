# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121013173224) do

  create_table "builds", :force => true do |t|
    t.integer  "repository_id"
    t.integer  "status"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string   "state"
    t.integer  "duration"
    t.integer  "result"
    t.integer  "previous_result"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "repositories", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "last_build_id"
    t.string   "last_build_number"
    t.integer  "last_build_status"
    t.datetime "last_build_started_at"
    t.datetime "last_build_finished_at"
    t.integer  "last_build_result"
    t.text     "description"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "owner_name"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "repositories", ["last_build_started_at"], :name => "index_repositories_on_last_build_started_at"
  add_index "repositories", ["owner_name", "name"], :name => "index_repositories_on_owner_name_and_name"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "login"
    t.string   "email"
    t.boolean  "is_admin",           :default => false
    t.integer  "github_id"
    t.string   "github_oauth_token"
    t.string   "gravatar_id"
    t.string   "locale"
    t.integer  "sign_in_count",      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "users", ["github_id"], :name => "index_users_on_github_id"
  add_index "users", ["github_oauth_token"], :name => "index_users_on_github_oauth_token"
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
