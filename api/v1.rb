# frozen_string_literal: true

require 'sinatra'
require 'json'

set :views => File.dirname(__FILE__) + "/views"

require_relative './controllers/warehouse'

# Default redirect to the warehouse api for demonstration purposes,
get '/api/v1' do
  redirect '/api/v1/warehouse/'
end

# Default redirect to the warehouse api for demonstration purposes,
get '/api' do
  redirect '/api/v1/warehouse/'
end
