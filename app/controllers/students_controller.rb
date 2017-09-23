class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      # @todo 教師機能ページへ戻る
    else
      render 'new'
    end
  end

  private

  def student_params
    params
      .require(:student)
      .permit(:name, :grade, :department, :education_number,
              :password, :password_confirmation)
  end
end
