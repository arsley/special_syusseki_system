# Preview all emails at http://localhost:3000/rails/mailers/attend_notice_mailer
class AttendNoticeMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/attend_notice_mailer/weekly_summary
  def weekly_summary
    AttendNoticeMailer.weekly_summary(Teacher.first)
  end
end
