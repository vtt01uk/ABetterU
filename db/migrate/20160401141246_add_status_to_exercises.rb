class AddStatusToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :status, :boolean, default: false
  end
end
