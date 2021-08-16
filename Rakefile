# frozen_string_literal: true

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:test) do |t|
    t.fail_on_error = false
  end
end

task default: %w[clean test create_db serve]

task :clean do
  puts 'Cleaning project...\n'
  rm_rf 'data/database.db'
end

task :create_db do
  require 'json'
  require 'sequel'

  puts "Creating database...\n"

  DB = Sequel.sqlite('data/database.db')

  DB.create_table :products do
    primary_key :productId
    String      :description
    Integer     :quantityOnHand
    Integer     :reorderThreshold
    Integer     :reorderAmount
    Integer     :deliveryLeadTime
  end
  DB.create_table :orders do
    primary_key :orderId
    String      :status
    String      :dateCreated
  end
  DB.create_table :order_items do
    primary_key :id
    Integer     :orderId
    Integer     :productId
    Integer     :quantity
    String      :costPerItem
  end

  products    = DB[:products]
  orders      = DB[:orders]
  order_items = DB[:order_items]

  data_file = File.read('data.json')
  data_hash = JSON.parse(data_file)

  data_hash["products"].each do |product|
    products.insert(product)
  end
  data_hash["orders"].each do |order|
    order["items"].each do |order_item|
      order_items.insert(order_item)
    end
    orders.insert(order.except("items"))
  end
end

task :serve do
  puts "Executing application...\n"
  ruby "app.rb"
end
