# frozen_string_literal: true

require 'sequel'

require_relative './product'

module Models
  ##
  # This class represents the order item logic
  class OrderItem < Sequel::Model
    many_to_one :product, class_name: 'Models::Product'

    ##
    #
    def on_hand?
      product.quantity_on_hand >= quantity
    end

    ##
    #
    def deduct
      product.deduct quantity
    end

    # FIXME: Look into how sequel handles saving
    def after_save
      super
      product.save
    end
  end
end
