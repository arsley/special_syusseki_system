require 'test_helper'

class StudentLoginTest < ActionDispatch::IntegrationTest
  def setup
    @student = students(:student1)

    # 画像は保存しない形でログインさせる
    @student_login_param = {
      education_number: @student.education_number,
      password: 'student',
      snapshot: 'noimage'
    }
  end

  test 'logout through login student' do
    get student_login_path
    post student_login_path, params: { student_sessions: @student_login_param }
    assert_redirected_to @student
    follow_redirect!
    assert_template 'students/show'
    assert student_logged_in?
    delete student_logout_path
    assert_not student_logged_in?
    assert_redirected_to student_login_url
  end
end
