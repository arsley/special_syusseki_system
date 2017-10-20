class StudentSessionsController < ApplicationController
  def new
  end

  def create
    student = Student.find_by(education_number: params[:student_sessions][:education_number])
    if student && student.authenticate(params[:student_sessions][:password])
      if dupedlogin_same_day?(student.id)
        flash.now[:danger] = '本日はすでに打刻済み、もしくは規定時間外です'
        render 'new'
        return
      end
      student.timecards.create!(timecard_params)
      login_student student
      redirect_to student
      return
    else
      flash.now[:danger] = '学籍番号とパスワードの組み合わせが間違っています'
      render 'new'
    end
  end

  def destroy
    logout_student
    redirect_to student_login_url
  end

  private

  def timecard_params
    params
      .require(:student_sessions)
      .permit(:snapshot)
      .merge(status: 'unchecked')
  end

  def dupedlogin_same_day?(student_id)
    !Timecard.where(created_at: Time.zone.now.all_day, student_id: student_id).empty?
  end
end
