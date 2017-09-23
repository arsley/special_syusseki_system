class StudentSessionsController < ApplicationController
  include StudentSessionsHelper

  def new
  end

  def create
    student = Student.find_by(education_number: params[:student_sessions][:education_number])
    if student && student.authenticate(params[:student_sessions][:password])
      student.timecards.create!(timecard_params)
      login_student student
      redirect_to student
      # 打刻データを保存する
    else
      flash.now[:danger] = '学籍番号とパスワードの組み合わせが間違っています'
      render 'new'
    end
  end

  def destroy
    logout_student
    redirect_to student_login_url
  end

  private

  def timecard_params
    params
      .require(:student_sessions)
      .permit(:snapshot)
      .merge(status: "unchecked")
  end
end
