require 'bundler/gem_tasks'
require 'rake/testtask'
require 'exchange_rate'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

desc 'update exchange rates'
task :fetch_data_and_save_to_disk do
  puts 'Testing...'
  # ExchangeRate.fetch_data(options).deliver!
end

task :default => :test
