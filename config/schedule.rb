# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "cron_log.log"
set :environment, 'development'

every 1.day, at: '4:15 pm' do
  rake 'fetch_data_and_save_to_disk'
end

# Learn more: http://github.com/javan/whenever
