class AttendNoticeMailer < ActionMailer::Base
  default from: 'special.syusseki.system@gmail.com'
  layout 'mailer'

  def weekly_summary(teacher)
    @teacher  = teacher
    @students = teacher.students
    mail(to: @teacher.email, subject: 'タイムカード週次報告')
  end
end
