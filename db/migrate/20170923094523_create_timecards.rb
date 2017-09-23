class CreateTimecards < ActiveRecord::Migration[5.1]
  def change
    create_table :timecards do |t|
      t.text :snapshot
      t.string :status
      t.references :student, foreign_key: true

      t.timestamps
    end

    add_index :timecards, %i[student_id created_at]
  end
end
