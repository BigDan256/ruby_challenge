# frozen_string_literal: true

require 'sinatra'

require_relative './lib/apiv1'

get '/' do
  # For demonstration purposes, default redirect to the warehouse api
  redirect '/api/v1/warehouse/'
end
