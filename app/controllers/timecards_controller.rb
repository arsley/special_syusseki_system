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

  def new
    @student = Student.find(params[:id])
  end

  def create
    timecard_params = timecard_create_params
    if duplicated_creation?(timecard_params)
      flash[:danger] = '指定した日時にはすでにデータがあります'
      redirect_to timecard_create_url(timecard_params[:student_id])
      return
    end
    timecard = Timecard.create(timecard_params)
    flash[:success] = '打刻を作成しました、正しい内容となっているか確認してください'
    redirect_to timecard
  end

  def update
    timecard = Timecard.find(params[:id])
    timecard.update_attributes(status: timecard_update_params)
    flash[:success] = '更新しました、反映されているか確認してください'
    redirect_to timecard
  end

  private

  # created_date, created_timeからcreated_atを作るところも含める
  #
  # created_timeの対応については timecards/new.html.haml を参照
  def timecard_create_params
    param = params.require(:timecard)
    created_at = Time.zone.at(param[:created_date].to_i)
    case param[:created_time].to_i
    when 1 then created_at += 9.hour
    when 2 then created_at += (10.hour + 50.minutes)
    when 3 then created_at += (13.hour + 5.minutes)
    end
    param
      .merge(created_at: created_at, snapshot: 'noimage')
      .permit(:student_id, :created_at, :status, :snapshot)
  end

  def timecard_update_params
    params.permit(:status)[:status]
  end

  def duplicated_creation?(param)
    !Timecard.where(student_id: param[:student_id],
                    created_at: param[:created_at].all_day).empty?
  end
end
