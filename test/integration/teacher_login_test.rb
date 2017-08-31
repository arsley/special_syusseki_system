require 'test_helper'

class TeacherLoginTest < ActionDispatch::IntegrationTest
  def setup
    @teacher = teachers(:teacher1)
  end

  test 'check invalid login' do
    get teacher_login_path
    assert_template 'teacher_sessions/new'
    post teacher_login_path, params: { teacher_sessions: { email: '', password: '' } }
    assert_template 'teacher_sessions/new'
    assert_not flash.empty?
  end

  test 'logout through login' do
    get teacher_login_path
    post teacher_login_path, params: { teacher_sessions: { email: @teacher.email, password: 'teacher' } }
    assert_redirected_to @teacher
    follow_redirect!
    assert_template 'teachers/show'
    assert teacher_logged_in?
    delete teacher_logout_path
    assert_not teacher_logged_in?
    assert_redirected_to root_url
    # follow_redirect!
  end
end
