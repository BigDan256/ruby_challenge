# frozen_string_literal: true

module APIV1
  module Models
    class Product
      attr_reader :product_id,
                  :description,
                  :quantity_on_hand,
                  :reorder_threshold,
                  :reorder_amount,
                  :delivery_lead_time
    end
  end
end
