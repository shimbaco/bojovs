Bojovs::Application.routes.draw do
  namespace :admin do
    devise_for :users, controllers: { sessions: 'admin/sessions' }, class_name: 'Admin::User',
      path_names: { sign_in: 'signin', sign_out: 'signout' }

    namespace :blog do
      resources :articles
    end

    root to: 'dashboard#index'
  end

  match ':year/:month/:day/:slug' => 'blog/articles#show', as: :blog_articles,
    year: /[0-9]{4}/, month: /[0-9]{2}/, day: /[0-9]{2}/, slug: /([a-z]|[A-Z]|[0-9]|-)+/

  root to: 'home#index'
end