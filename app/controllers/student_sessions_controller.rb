class StudentSessionsController < ApplicationController
  include StudentSessionsHelper

  def new
  end

  def create
    student = Student.find_by(education_number: params[:student_sessions][:education_number])
    if student && student.authenticate(params[:student_sessions][:password])
      # 打刻データを保存する
      # 学生ユーザようページへリダイレクトする
    else
      flash.now[:danger] = '学籍番号とパスワードの組み合わせが間違っています'
      render 'new'
    end
  end

  def destroy
  end
end
