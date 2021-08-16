# frozen_string_literal: true

require_relative './controllers/warehouse'

get '/api/v1/warehouse/' do
  controller = Controllers::Warehouse.new
  controller.index
end

post '/api/v1/warehouse/fulfilment' do
  controller = Controllers::Warehouse.new
  controller.fulfilment params['order_ids']
end

