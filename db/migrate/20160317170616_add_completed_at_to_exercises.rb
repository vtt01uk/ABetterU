class AddCompletedAtToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :completed_at, :datetime
  end
end
