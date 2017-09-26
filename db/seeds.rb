# 学生サンプルデータ
Student.create(name: "Student1", grade: 5, department: "CS", education_number: 13547, password_digest: Teacher.digest("student"))

# 教員サンプルデータ
Teacher.create(name: "Teacher1", email: "teacher1@edu.hoge", room_grade: 5, room_course: "AD", password_digest: Teacher.digest("teacher"))
