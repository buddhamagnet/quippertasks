class ChangeDeadlineToDate < ActiveRecord::Migration
  def up
    change_column :tasks, :deadline, :date
  end

  def down
    change_column :tasks, :deadline, :datetime
  end
end
