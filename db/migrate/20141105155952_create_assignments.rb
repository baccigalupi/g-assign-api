class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :type
      t.string :location

      t.date :assigned_on
      t.date :due_on

      t.timestamps
    end
  end
end
