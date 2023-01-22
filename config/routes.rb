Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :users, :controllers => {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  get 'homes/top'
  root to: "homes#top"
  
  scope module: :public do
    resources :question_comments, only: [:index]
    resources :post_comments, only: [:index]
    resources :follows, only: [:followers, :followings]
    resources :questions, only: [:new, :index, :show, :edit]
    resources :post_images, only: [:new, :index, :show, :edit]
    resources :users, only: [:show, :edit, :unsubscribe]
    
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
