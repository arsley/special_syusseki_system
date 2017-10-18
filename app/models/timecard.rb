class Timecard < ApplicationRecord
  # タイムカード(打刻)データは各々の学生アカウントに所有される
  belongs_to :student

  # 対象となる学生アカウントのIDを必須とする
  validates :student_id, presence: true

  # 打刻時の顔画像データ(Base64)は存在しなければならない
  validates :snapshot, presence: true

  # (打刻保存時)出席状況カラムが存在している必要がある
  validates :status, presence: true

  # 打刻状況の表示をさせる
  def puts_status
    case status
    when 'unchecked' then '未確認'
    when 'fail' then 'NG'
    when 'pass' then 'OK'
    when 'sick' then '病欠'
    when 'through' then '公欠'
    end
  end
end
