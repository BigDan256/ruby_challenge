# frozen_string_literal: true

require 'logger'
require 'sequel'

DB.loggers << Logger.new($stdout)

require_relative './order'
require_relative './product'

module Models
  ##
  # This class represents the warehouse logic
  class Warehouse
    ##
    #
    def purchase_product(product_id)
      # FIXME: Beyond scope
    end

    ##
    #
    def fulfil_order(order_id)
      order = Models::Order[order_id]

      return false unless order.instance_of?(Models::Order)
      return false unless order[:status] == 'Pending'
      return false unless order.on_hand?

      result = false
      DB.transaction do
        DB.after_commit { result = true }
        order.fulfil
        order.save
      end

      result
    end
  end
end
