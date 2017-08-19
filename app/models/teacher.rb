class Teacher < ApplicationRecord
  # 正しいクラスの組み合わせかどうかを検証するための定数とメソッド
  VALID_COURSES = %w[1A 1B 1C 1D 2A 2B 2C 2D
                     3AD 3EE 3ME 3CS 4AD 4EE 4ME 4CS 5AD 5EE 5ME 5CS].freeze
  def course_valid?
    course = room_grade.to_s + room_course.to_s
    unless VALID_COURSES.include?(course)
      errors.add(:room_grade,  'is something wrong')
      errors.add(:room_course, 'is something wrong')
      # errors.add(:room_grade,  '担当学年に間違いがあります')
      # errors.add(:room_course, '担当クラスに間違いがあります')
    end
  end

  # メールアドレスは全て小文字で保存する
  before_save { self.email = email.downcase }

  # メールアドレスのバリデーション用正規表現
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # 空白は許さない
  # 氏名は55文字以下
  # メールアドレスは一意かつ255文字以下
  validates :name, presence: true, length: { maximum: 55 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true, length: { maximum: 255 }
  validate :course_valid?

  # パスワード
  has_secure_password
end
