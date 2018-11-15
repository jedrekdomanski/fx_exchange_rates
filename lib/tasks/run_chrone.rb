desc 'update database'
task task_to_run_each_day: :environment do
  # ... set options if any
  ExchangeRate.fetch_data(options).deliver!
end