class Student < ApplicationRecord
  # 学生はタイムカード(のデータ)を複数持つ
  # ユーザが削除された時、打刻データも削除させる
  has_many :timecards, dependent: :destroy

  # 学生は、ただ1人の担任のもとで指導を受ける
  belongs_to :teacher

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

  # 連続出席日数をカウントする
  #
  # #status == 'pass' を出席扱い (+1)
  # #status == 'fail' は欠席扱い (become = 0)
  # #status == 'through' もしくは 'unchecked' は公用欠席関係 (据え置き)
  def counts_attendance
    attend_lists = timecards.order('created_at DESC')
    attend_count = 0
    attend_lists.each do |attend|
      break if attend_count == 12 || attend.status == 'fail'
      next if attend.status == 'through' || attend.status == 'unchecked'
      attend_count += 1
    end
    attend_count
  end
end
