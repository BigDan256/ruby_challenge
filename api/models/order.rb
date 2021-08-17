# frozen_string_literal: true

require 'sequel'

require_relative './order_item'

module Models
  class Order < Sequel::Model
    one_to_many :items, class_name: 'Models::OrderItem'
  end
end
