require 'test_helper'

class TimecardTest < ActiveSupport::TestCase
  def setup
    @student  = students(:student1)
    @timecard = @student.timecards.build(snapshot: "temporary", status: "unchecked")
  end

  test "should be valid" do
    assert @timecard.valid?
  end

  test "student id should be present" do
    @timecard.student_id = nil
    assert_not @timecard.valid?
  end
end
