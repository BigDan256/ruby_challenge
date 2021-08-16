# frozen_string_literal: true

require 'sequel'
require 'sinatra'

module Controllers
  class Warehouse
    DB = Sequel.sqlite('data/database.db')

    def initialize
      @products    = DB[:products]
      @orders      = DB[:orders]
      @order_items = DB[:order_items]
    end

    def index
      erb 'warehouse/index'
    end

    def fulfilment(order_ids)
      orders_to_fulfil = @orders.where(orderId: order_ids, status: 'Pending')

      request_counts = Hash.new(0)
      orders_to_fulfil.each do |order|
        order_items = @order_items.where(orderId: order['orderId'])
        order_items.each do |order_item|
          request_counts[order_item['productId']] += order_item['quantity']
        end
      end

      print request_counts

    end
  end
end
