# frozen_string_literal: true

require 'sequel'

module Models
  class Product < Sequel::Model
    def validate
      super
      errors.add(:quantity_on_hand, "can't be negative") if quantity_on_hand < 0
    end
  end
end
