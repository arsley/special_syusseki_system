Rails.application.routes.draw do
  root 'static_pages#choice'

  # 教員関連のルーティング
  get 'teachers/new'
  post 'teachers/new', to: 'teachers#create'
  get 'teachers/info', to: 'teachers#info', as: 'teacher_info'

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

  # タイムカード関連のルーティング
  get 'timecards/student/:id',     to: 'timecards#student_index', as: 'timecard_show'
  get 'timecards/student/:id/new', to: 'timecards#new',           as: 'timecard_create'

  # リソースのルーティング
  resources :teachers, only: [:show]
  resources :students, only: [:show]
  resources :timecards, only: %i[create index show update]

  # 開発専用ルーティング
  get 'develop/studentshow/:id', to: 'students#debug_show'
end
