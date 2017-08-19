class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.integer :room_grade
      t.string :room_course
      t.string :password_digest

      t.timestamps
    end

    # メールアドレスに一意性を付与する
    add_index :teachers, :email, unique: true
  end
end
