require 'bundler/capistrano'
require 'capistrano/ext/multistage'
require 'capistrano_colors'
require 'rvm/capistrano'


set :application, 'bojovs'
set :deploy_via, :remote_cache
set :repository, "git@github.com:bojovs/#{application}.git"
set :rvm_type, :user
set :scm, :git
set :unicorn_port, 3000
set :use_sudo, false

# SSH
default_run_options[:pty] = true


namespace :deploy do
  task :symlink_contents do
    run "ln -s #{shared_path}/database.yml #{release_path}/config"
  end

  task :start, roles: :app do
    run "cd #{current_path}; bundle exec unicorn_rails -l #{unicorn_port} -E #{rails_env} -D"
  end
  
  task :stop, roles: :app do
    run "if [ -f '#{shared_path}/pids/unicorn.pid' ]; then kill -KILL -s QUIT `cat #{shared_path}/pids/unicorn.pid`; fi"
  end

  task :restart, roles: :app do
    deploy.stop
    deploy.start
  end
end

before 'deploy:assets:symlink', 'deploy:symlink_contents'

after 'deploy' do
  deploy.migrate
  deploy.cleanup
end
