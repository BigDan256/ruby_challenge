# frozen_string_literal: true

require 'sequel'
require 'sinatra'

DB = Sequel.sqlite('data/database.db')

require_relative '../models/order'
require_relative '../models/warehouse'

get '/api/v1/warehouse/' do
  erb :'warehouse/index', { locals: { orders: Models::Order } }
end

post '/api/v1/warehouse/fulfilment' do
  halt 400 unless Array == params['orderIds'].class

  result    = []
  warehouse = Models::Warehouse.new

  # Validate and fulfil input orders
  params['orderIds'].map do |v|
    result << v.to_i unless warehouse.fulfil_order v.to_i
  end

  content_type :json
  result.to_json
end
