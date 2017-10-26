class TeachersController < ApplicationController
  before_action :logged_in_teacher, only: %i[show edit update]

  def show
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      login_teacher @teacher
      flash[:success] = 'ログインしました'
      redirect_to @teacher
    else
      render 'new'
    end
  end

  def edit
    # @todo アカウント情報変更
  end

  def update
    # @todo アカウント情報変更
  end

  private

  def teacher_params
    params
      .require(:teacher)
      .permit(:name, :email, :password, :password_confirmation,
              :room_grade, :room_course)
  end
end
