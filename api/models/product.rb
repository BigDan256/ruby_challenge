# frozen_string_literal: true

require 'sequel'

module Models
  ##
  # This class represents the product logic
  class Product < Sequel::Model
    def validate
      super

      errors.add(:quantity_on_hand, "can't be negative") if quantity_on_hand.negative?
    end
  end
end
