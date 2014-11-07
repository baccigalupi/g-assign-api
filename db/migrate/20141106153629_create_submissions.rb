class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :github_name
      t.string :location
      t.integer :assignment_id
      t.datetime :submitted_at

      t.timestamps
    end
  end
end
