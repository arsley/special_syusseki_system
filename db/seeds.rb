# 教員サンプルデータ
Teacher.create(name: "Teacher1", email: "teacher1@edu.hoge", room_grade: 5, room_course: "CS", password_digest: Teacher.digest("teacher"))

# 学生サンプルデータ
student_baseparams = {
  name: "Student1",
  education_number: 13_547,
  password_digest: Student.digest("student"),
  teacher_id: Teacher.first.id
}

Student.create(student_baseparams)
Student.create(student_baseparams.merge(name: 'Student2', education_number: 13_333))
Student.create(student_baseparams.merge(name: 'Student3', education_number: 13_000))

# 打刻サンプルデータ
basetime = Time.zone.local(2017, 5, 1, 8, 45, 0)
timecard_baseparams = {
  snapshot: 'noimage',
  status: 'unchecked',
  student_id: Student.first.id,
  created_at: basetime
}

# Student1に12日分の「未確認」打刻データを入れる
12.times do |i|
  Timecard.create(timecard_baseparams.merge(created_at: basetime + i.day))
end

# Student2に5日分の「確認済み」打刻データを入れる
timecard_baseparams.update(status: 'pass', student_id: Student.second.id)
5.times do |i|
  Timecard.create(timecard_baseparams.merge(created_at: basetime + i.day))
end
