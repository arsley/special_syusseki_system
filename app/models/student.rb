class Student < ApplicationRecord
  # 基本的に空白は許さない
  validates :name, presence: true
  # 学籍番号は5文字で固定、一意であり整数のみ
  validates :education_number, presence: true, length: { is: 5 },
                               uniqueness: true, numericality: { only_integer: true }
  has_secure_password
end
