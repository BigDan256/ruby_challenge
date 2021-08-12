# frozen_string_literal: true

module APIV1
  module Models
    class FulfilmentForm
      attr_reader :order_ids

      def initialize(_form_data)
        @order_ids = []
      end
    end
  end
end
