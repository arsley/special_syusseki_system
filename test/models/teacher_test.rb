require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  def setup
    @teacher = Teacher.new(name: 'teacher', email: 'teacher@hoge.edu',
                           room_grade: '5', room_course: 'CS',
                           password: 'foo', password_confirmation: 'foo')
  end

  test 'Email should be unique' do
    duplicate_teacher = @teacher.dup
    @teacher.save
    assert_not duplicate_teacher.valid?
  end

  test 'Email address should be lowercase when saved' do
    collapsed_email = 'tEACHer@HOge.edU'
    @teacher.email = collapsed_email
    @teacher.save
    assert_equal collapsed_email.downcase, @teacher.reload.email
  end

  test 'Pre-tech course should be configured by mixed department(A, B, C or D)' do
    grades = [1, 2]
    cources = %w[AD EE ME CS]
    grades.each do |g|
      cources.each do |c|
        @teacher.room_grade = g
        @teacher.room_course = c
        assert_not @teacher.valid?
      end
    end
  end

  test 'Tech course should be configured by single department(AD, EE, ME or CS)' do
    grades = [3, 4, 5]
    cources = %w[A B C D]
    grades.each do |g|
      cources.each do |c|
        @teacher.room_grade = g
        @teacher.room_course = c
        assert_not @teacher.valid?
      end
    end
  end
end
