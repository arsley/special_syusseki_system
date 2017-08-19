class TeachersController < ApplicationController
  def index;
    # @todo ダッシュボード画面
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      # @todo ログイン後の画面へ
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

  def login
    # @todo ログイン
  end

  def logout
    # @todo ログアウト
  end

  private

  def teacher_params
    params
      .require(:teacher)
      .permit(:name, :email, :password, :password_confirmation,
              :room_grade, :room_course)
  end
end
