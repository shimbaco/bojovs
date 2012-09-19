set :output, '/home/com-bojovs/shared/log/whenever.log'

# every 1.day, at: '5:00 am' do
every 5.minutes do
  command "cd #{current_path}; RAILS_ENV=:environment bundle exec backup perform --trigger database --config-file 'config/backup/config.rb'"
  command "cd #{current_path}; RAILS_ENV=:environment bundle exec backup perform --trigger log --config-file 'config/backup/config.rb'"
end