# frozen_string_literal: true

require 'sequel'

require_relative './product'

module Models
  ##
  # This class represents the order item logic
  class OrderItem < Sequel::Model
    many_to_one :product, class_name: 'Models::Product'
  end
end
