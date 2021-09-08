# frozen_string_literal: true

require 'sequel'

require_relative './order_item'

module Models
  ##
  # This class represents the order logic
  class Order < Sequel::Model
    one_to_many :items, class_name: 'Models::OrderItem'

    ##
    #
    def on_hand?
      true
      items.each do |item|
        return false unless item.on_hand?
      end
    end

    ##
    #
    def fulfil
      items.each do |item|
        item.deduct
      end
      status = 'Fulfilled'
    end

    ##
    #
    def after_save
      super
      items.each do |item|
        item.save
      end
    end
  end
end
