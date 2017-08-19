class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :name
      t.integer :grade
      t.string :department
      t.integer :education_number
      t.string :password_digest

      t.timestamps
    end
  end
end
