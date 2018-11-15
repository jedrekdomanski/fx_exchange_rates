# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "../cron_log.log"
set :environment, 'development'

every 1.minute do
   rake "task_to_run_each_day"
end
#every 1.day, at: ['8:00 am'] do
 #  rake "ExchangeRate:task_to_run_each_day"
#end

# Learn more: http://github.com/javan/whenever
