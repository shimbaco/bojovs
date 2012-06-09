Bojovs::Application.routes.draw do
  namespace :admin do
    devise_for :users, controllers: { sessions: 'devise/sessions' }, class_name: 'Admin::User',
      path_names: { sign_in: 'signin', sign_out: 'signout' }

    root to: 'home#index'
  end

  root to: 'home#index'
end