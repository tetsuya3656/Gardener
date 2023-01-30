Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :users, :controllers => {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  get 'homes/top'
  root to: "homes#top"
  
  scope module: :public do
    resources :follows, only: [:followers, :followings]
    resources :questions, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
       resources :question_comments, only: [:create, :destroy]
    end
    resources :post_images, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
       resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update, :unsubscribe]
    
    # 退会確認画面
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  # 論理削除用のルーティング
  patch '/users/:id/withdraw' => 'users#withdraw', as: 'withdraw'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
