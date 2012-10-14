class CleanUpBattles < ActiveRecord::Migration
  def change
    change_column_default :builds, :result, 0
    remove_columns :builds, :previous_result, :status
    remove_columns :repositories, :last_build_id, :last_build_number, :last_build_status, :last_build_started_at, :last_build_finished_at, :last_build_result
  end
end
