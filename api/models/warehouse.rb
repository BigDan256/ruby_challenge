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

      result = false
      DB.transaction do
        DB.after_commit { result = true }

        order.items.each do |item|
          product = item.product

          raise Sequel::Rollback if item.quantity > product.quantity_on_hand

          if product.quantity_on_hand - item.quantity <= product.reorder_threshold
            if product.reorder_threshold <= product.quantity_on_hand
              purchase_product product.pk
            end
          end

          product[:quantity_on_hand] -= item[:quantity]
          product.save
        end

        order[:status] = 'Fulfilled'
        order.save
      end

      result
    end
  end
end
