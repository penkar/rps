require 'active_record_tasks'

ActiveRecordTasks.configure do |config|
  config.db_dir = 'db'
  config.db_config_path = 'db/config.yml'
  config.env = ENV['APP_ENV']
end

ActiveRecordTasks.load_tasks
