class TimecardsController < ApplicationController
  before_action :logged_in_teacher

  def index
    @students = current_teacher.students
  end

  def student_index
    @student = Student.find(params[:id])
    @timecards = @student.timecards.order('created_at DESC')
  end

  def show
    @timecard = Timecard.find(params[:id])
    @student  = @timecard.student
  end

  def update
    timecard = Timecard.find(params[:id])
    timecard.update_attributes(status: timecard_update_params)
    flash[:success] = '更新しました、反映されているか確認してください'
    redirect_to timecard
  end

  private

  def timecard_update_params
    params.permit(:status)[:status]
  end
end
