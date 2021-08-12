# frozen_string_literal: true

require_relative './order_item'

module APIV1
  module Models
    class Order
      attr_reader :order_id,
                  :status,
                  :date_created

      def items
        []
      end
    end
  end
end
