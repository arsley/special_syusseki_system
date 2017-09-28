class TeachersController < ApplicationController
  before_action :teacher_logged_in, only: %i[edit update]

  def show
    # @todo ダッシュボード画面
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

  def logged_in_teacher
    unless teacher_logged_in?
      flash[:danger] = '教員ログインが必要なページです'
      redirect_to teacher_login_url
    end
  end
end
