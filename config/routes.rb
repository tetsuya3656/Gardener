Rails.application.routes.draw do
  namespace :public do
    get 'question_comments/index'
  end
  namespace :public do
    get 'post_comments/index'
  end
  namespace :public do
    get 'follows/followings'
    get 'follows/followers'
  end
  namespace :public do
    get 'questions/new'
    get 'questions/index'
    get 'questions/show'
    get 'questions/edit'
  end
  namespace :public do
    get 'post_images/new'
    get 'post_images/index'
    get 'post_images/show'
    get 'post_images/edit'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/unsubscribe'
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
