class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :students_count
      t.integer :teachers_count

      t.timestamps
    end
  end
end
