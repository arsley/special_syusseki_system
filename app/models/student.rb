class Student < ApplicationRecord
  # 学生はタイムカード(のデータ)を複数持つ
  has_many :timecards

  # 基本的に空白は許さない
  validates :name, presence: true

  # 学籍番号は5文字で固定、一意であり整数のみ
  validates :education_number, presence: true, length: { is: 5 },
                               uniqueness: true, numericality: { only_integer: true }

  # パスワード関連の設定
  has_secure_password

  # テスト用隠蔽パスワード生成
  def self.digest(password)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(password, cost: cost)
  end
end
