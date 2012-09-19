set :output, '/home/com-bojovs/shared/log/whenever.log'

job_type :backup, "cd #{current_path}; RAILS_ENV=#{environment} bundle exec backup perform --trigger :task --config-file 'config/backup/config.rb'"

# every 1.day, at: '5:00 am' do
every 5.minutes do
  backup 'database'
  backup 'log'
end