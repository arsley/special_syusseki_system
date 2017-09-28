class StudentsController < ApplicationController
  before_action :logged_in_teacher, only: %i[new create]

  def show
  end

  def new
    @student = Student.new
  end

  # 各教員が、新しい学生を担当として持つ
  def create
    teacher = current_teacher
    @student = teacher.students.build(student_params)
    if @student.save
      flash[:success] = '学生アカウントを登録しました'
      redirect_to teacher
    else
      render 'new'
    end
  end

  private

  def student_params
    params
      .require(:student)
      .permit(:name, :education_number,
              :password, :password_confirmation)
  end

  def logged_in_teacher
    unless teacher_logged_in?
      flash[:danger] = '教員ログインが必要なページです'
      redirect_to teacher_login_url
    end
  end
end
