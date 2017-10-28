module ApplicationHelper
  # 教員ログインが必要なページへアクセスした場合、ログインを促す
  def logged_in_teacher
    return if teacher_logged_in?
    flash[:danger] = '教員ログインが必要なページです'
    redirect_to teacher_login_url
  end
end
