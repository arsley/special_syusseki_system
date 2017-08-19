Rails.application.routes.draw do
  # 教員関連のルーティング
  get 'teachers/login'
  get 'teachers/new'
  post 'teachers/new', to: 'teachers#create'

  # 生徒関連のルーティング
  get 'students/login'
  get 'students/new'
  post 'students/new', to: 'students#create'
end
