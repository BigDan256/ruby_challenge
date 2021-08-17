# frozen_string_literal: true

require 'sinatra'

require_relative './api/v1'

# Default redirect to the warehouse api for demonstration purposes,
get '/' do
  redirect '/api/v1/warehouse/'
end
