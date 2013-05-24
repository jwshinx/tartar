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

get '/customers' do
 customers = Customer.all
 if customers.empty?
  error 404, { :error => 'customers not found' }.to_json
 else
  customers.to_json
 end
end

get '/customers/:id' do
 cust = Customer.find_by_id params[:id]
 if cust
  cust.to_json
 else
  error 404, { error: 'customer not found' }.to_json
 end
end

post '/customers' do
 begin
  customer = Customer.create(JSON.parse(request.body.read))
  if customer.valid?
   customer.to_json
  else
   error 400, customer.errors.to_json
  end
 rescue => e
  error 400, e.message.to_json
 end
end

put '/customers/:id' do
 begin
  customer = Customer.find_by_id params[:id]
  if customer
   begin
    if customer.update_attributes(JSON.parse(request.body.read))
     customer.to_json
    else
     error 400, customer.errors.to_json
    end
   rescue => e
    error 400, e.message.to_json
   end
  else
   error 404, { :error => 'customer not found' }.to_json
  end
 end
end

delete '/customers/:id' do
 customer = Customer.find_by_id params[:id]
 if customer
  customer.destroy
  customer.to_json
 else
  error 404, { :error => 'customer not found' }.to_json
 end
end
