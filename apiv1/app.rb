# frozen_string_literal: true

require 'sinatra'

require_relative './controllers/warehouse'

get '/api/v1/warehouse/fulfilment' do
  controller = APIV1::Controllers::Warehouse.new
  controller.fulfilment
end
