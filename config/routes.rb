Rails.application.routes.draw do
  # 生徒関連のルーティング
  get 'students/login'
  get 'students/new'
  post 'students/new', to: 'students#create'
end
