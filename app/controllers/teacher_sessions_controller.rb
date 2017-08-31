class TeacherSessionsController < ApplicationController
  include TeacherSessionsHelper

  def new
  end

  def create
    teacher = Teacher.find_by(email: params[:teacher_sessions][:email].downcase)
    if teacher && teacher.authenticate(params[:teacher_sessions][:password])
      login_teacher teacher
      redirect_to teacher
    else
      flash.now[:danger] = 'メールアドレスとパスワードの組み合わせが間違っています'
      render 'new'
    end
  end

  def destroy
    logout_teacher
    redirect_to root_url
  end
end
