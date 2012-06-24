Bojovs::Application.routes.draw do
  namespace :admin do
    devise_for :users, controllers: { sessions: 'admin/sessions' }, class_name: 'Admin::User',
      path_names: { sign_in: 'signin', sign_out: 'signout' }

    namespace :blog do
      resources :articles
    end

    root to: 'dashboard#index'
  end

  root to: 'home#index'
end