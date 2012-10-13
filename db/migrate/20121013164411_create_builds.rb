class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.belongs_to  :repository

      t.integer  :status

      t.datetime :started_at
      t.datetime :finished_at

      t.string   :state
      t.integer  :duration

      t.integer  :result
      t.integer  :previous_result

      t.timestamps
    end
  end
end
