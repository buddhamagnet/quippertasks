class ChangeDeadlineToDate < ActiveRecord::Migration
  def up
    change_column :task, :deadline, :date
  end

  def down
    change_column :task, :deadline, :datetime
  end
end
