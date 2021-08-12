# frozen_string_literal: true

module APIV1
  module Models
    class OrderItem
      attr_reader :order_id,
                  :product_id,
                  :quantity,
                  :cost_per_item
    end
  end
end
