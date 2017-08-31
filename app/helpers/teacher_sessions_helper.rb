module TeacherSessionsHelper
  def login_teacher(teacher)
    session[:teacher_id] = teacher.id
  end

  def current_teacher
    @current_teacher ||= Teacher.find_by(id: session[:teacher_id])
  end

  def teacher_logged_in?
    !current_teacher.nil?
  end

  def logout_teacher
    session.delete(:teacher_id)
    @current_teacher = nil
  end
end
