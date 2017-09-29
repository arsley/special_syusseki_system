class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :education_number
      t.string :password_digest
      t.references :teacher, foreign_key: true

      t.timestamps
    end

    # 学籍番号に一意性を付与する
    add_index :students, :education_number, unique: true
  end
end
