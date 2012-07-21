Bojovs::Application.routes.draw do
  namespace :admin do
    devise_for :users, controllers: { sessions: 'admin/sessions' },
      path_names: { sign_in: 'signin', sign_out: 'signout' }

    resources :notes

    root to: 'dashboard#index'
  end

  match ':year/:month/:day/:slug' => 'notes#show', as: :notes,
    year: /[0-9]{4}/, month: /[0-9]{2}/, day: /[0-9]{2}/, slug: /([a-z]|[A-Z]|[0-9]|-)+/

  root to: 'home#index'
end