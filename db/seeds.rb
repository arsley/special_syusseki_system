# 教員サンプルデータ
Teacher.create(name: "Teacher1", email: "teacher1@edu.hoge", room_grade: 5, room_course: "CS", password_digest: Teacher.digest("teacher"))

# 学生サンプルデータ
Student.create(name: "Student1", education_number: 13547, password_digest: Student.digest("student"), teacher_id: Teacher.first.id)
