# frozen_string_literal: true

require 'sequel'

require_relative './warehouse'

module Models
  ##
  # This class represents the product logic
  class Product < Sequel::Model
    def validate
      super

      errors.add(:quantity_on_hand, "can't be negative") if quantity_on_hand.negative?
    end

    ##
    #
    def deduct(quantity)
      warehouse = Models::Warehouse.new

      # FIXME: Refactor this so that purchase can be done on save
      # Must be some sequel trick available to compare before/after
      if quantity_on_hand > reorder_threshold
        if quantity_on_hand - quantity <= reorder_threshold
          warehouse.purchase_product pk
        end
      end

      # FIXME: why is quantity null?
      #quantity_on_hand = quantity_on_hand - quantity
    end
  end
end
