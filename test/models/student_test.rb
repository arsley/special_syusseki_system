require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  def setup
    @student = Student.new(name: 'testuser', grade: '5', department: 'CS',
                           education_number: '13547',
                           password: 'foo', password_confirmation: 'foo')
  end

  test 'Education number should be unique' do
    duplicate_student = @student.dup
    @student.save
    assert_not duplicate_student.valid?
  end
end
