Rails.application.routes.draw do
  # rootパスを設定しないとゲストログインはエラーとなる　→　「掲示板一覧表示機能」に合わせてrootパスを設定
  # root 'posts#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
