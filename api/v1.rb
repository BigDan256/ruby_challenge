# frozen_string_literal: true

require_relative './controllers/warehouse'

set :views => File.dirname(__FILE__) + "/views"

get '/api/v1/warehouse/' do
  erb :'warehouse/index'
end

post '/api/v1/warehouse/fulfilment' do
  controller = Controllers::Warehouse.new
  controller.fulfilment params['order_ids']
end

