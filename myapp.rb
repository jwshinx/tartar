require 'sinatra'
require 'active_record'
#require 'models/customer'

env_index = ARGV.index("-e")
env_arg = ARGV[env_index + 1] if env_index
env = env_arg || ENV["SINATRA_ENV"] || "development"
databases = YAML.load_file("config/database.yml")
ActiveRecord::Base.establish_connection(databases[env])

get '/' do
  'Hello Oakland!!!!'
end
