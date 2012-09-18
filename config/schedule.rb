set :output, '/home/com-bojovs/shared/log/whenever.log'

# every 1.day, at: '5:00 am' do
every 5.minutes do
  command 'RAILS_ENV=:environment bundle exec backup perform -t database -c "config/backup/config.rb"'
end