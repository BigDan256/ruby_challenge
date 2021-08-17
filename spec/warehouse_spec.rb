# frozen_string_literal: true

require_relative '../apiv1/controllers/warehouse'

RSpec.describe APIV1::Controllers::Warehouse do
  before do
    @warehouse = new APIV1::Controllers::Warehouse
  end

  context '.fulfilment' do
    it 'responds to fulfilment' do
      expect(@warehouse).to respond_to(:fulfilment)
    end
  end
end
