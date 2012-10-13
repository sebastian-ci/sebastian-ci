class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string   :name
      t.string   :url

      t.integer  :last_build_id
      t.string   :last_build_number
      t.integer  :last_build_status
      t.datetime :last_build_started_at
      t.datetime :last_build_finished_at
      t.integer  :last_build_result

      t.text     :description

      t.integer  :owner_id
      t.string   :owner_type
      t.string   :owner_name

      t.timestamps
    end

    add_index :repositories, [:last_build_started_at], :name => :index_repositories_on_last_build_started_at
    add_index :repositories, [:owner_name, :name], :name => :index_repositories_on_owner_name_and_name
  end
end
