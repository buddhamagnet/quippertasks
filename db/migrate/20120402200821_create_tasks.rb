class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.references :user

      t.timestamps
    end
    add_index :tasks, :user_id
  end
end
