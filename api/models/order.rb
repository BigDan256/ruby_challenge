# frozen_string_literal: true

require 'sequel'

require_relative './order_item'

module Models
  ##
  # This class represents the order logic
  class Order < Sequel::Model
    one_to_many :items, class_name: 'Models::OrderItem'
  end
end
