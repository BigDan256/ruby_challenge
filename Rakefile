# frozen_string_literal: true

require 'json'
require 'sequel'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:test) do |t|
  t.fail_on_error = false
end

task default: %w[clean test create_db populate_db serve]

task :clean do
  puts 'Cleaning project...\n'
  rm_rf 'data/database.db'
end

task :create_db do
  puts "Creating database...\n"

  DB = Sequel.sqlite('data/database.db')

  DB.create_table :products do
    primary_key :product_id
    String      :description
    Integer     :quantity_on_hand
    Integer     :reorder_threshold
    Integer     :reorder_amount
    Integer     :delivery_lead_time
  end
  DB.create_table :orders do
    primary_key :order_id
    String      :status
    String      :date_created
  end
  DB.create_table :order_items do
    primary_key :id
    Integer     :order_id
    Integer     :product_id
    Integer     :quantity
    String      :cost_per_item
  end
end

task :populate_db do
  puts "Populating database...\n"

  DB = Sequel.sqlite('data/database.db')

  products    = DB[:products]
  orders      = DB[:orders]
  order_items = DB[:order_items]

  data_file = File.read('data.json')
  data_hash = JSON.parse(data_file)

  data_hash['products'].each do |v|
    products.insert({
                      product_id: v['productId'],
                      description: v['description'],
                      quantity_on_hand: v['quantityOnHand'],
                      reorder_threshold: v['reorderThreshold'],
                      reorder_amount: v['reorderAmount'],
                      delivery_lead_time: v['deliveryLeadTime']
                    })
  end
  data_hash['orders'].each do |v1|
    v1['items'].each do |v2|
      order_items.insert({
                           order_id: v2['orderId'],
                           product_id: v2['productId'],
                           quantity: v2['quantity'],
                           cost_per_item: v2['costPerItem']
                         })
    end
    orders.insert({
                    order_id: v1['orderId'],
                    status: v1['status'],
                    date_created: v1['dateCreated']
                  })
  end
end

task :serve do
  puts "Executing application...\n"
  ruby 'app.rb'
end
