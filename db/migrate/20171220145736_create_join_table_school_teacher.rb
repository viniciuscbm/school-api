class CreateJoinTableSchoolTeacher < ActiveRecord::Migration[5.1]
  def change
    create_join_table :schools, :teachers do |t|
      t.index [:school_id, :teacher_id]
    end
  end
end
