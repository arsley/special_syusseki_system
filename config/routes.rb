Rails.application.routes.draw do
  root 'static_pages#choice'

  # 教員関連のルーティング
  get 'teachers/new'
  post 'teachers/new', to: 'teachers#create'

  # 教員ログインのルーティング
  get 'teacher/login', to: 'teacher_sessions#new'
  post 'teacher/login', to: 'teacher_sessions#create'
  delete 'teacher/logout', to: 'teacher_sessions#destroy'

  # 学生関連のルーティング
  get 'students/new'
  post 'students/new', to: 'students#create'

  # 学生ログインのルーティング
  get 'student/login', to: 'student_sessions#new'
  post 'student/login', to: 'student_sessions#create'
  delete 'student/logout', to: 'student_sessions#destroy'

  # リソースのルーティング
  resources :teachers, only: [:show]
end
