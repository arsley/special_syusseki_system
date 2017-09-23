module StudentSessionsHelper
  def login_student(student)
    session[:student_id] = student.id
  end

  def current_student
    @current_student ||= Student.find_by(id: session[:student_id])
  end

  def student_logged_in?
    !current_student.nil?
  end

  def logout_student
    session.delete(:student_id)
    @current_student = nil
  end
end
