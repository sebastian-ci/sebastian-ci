class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string   :name
      t.string   :login
      t.string   :email

      t.boolean  :is_admin,           :default => false

      t.integer  :github_id
      t.string   :github_oauth_token

      t.string   :gravatar_id
      t.string   :locale

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end

    add_index :users, [:github_id], :name => :index_users_on_github_id
    add_index :users, [:github_oauth_token], :name => :index_users_on_github_oauth_token
    add_index :users, [:login], :name => :index_users_on_login, :unique => true
  end
end
