# frozen_string_literal: true

require_relative '../apiv1/models/fulfilment_form'

RSpec.describe APIV1::Models::FulfilmentForm do
  describe "@order_ids" do
    before do
      @form = new APIV1::Models::FulfilmentForm
    end

    it "can hold a list of order ids" do
      expect(@form.order_ids).to exist
      expect(@form.order_ids).to be_instance_of(Array)
    end

    it "accepts form data" do
      @form.load([])
      expect(@form.order_ids.length).to be(1)
    end
  end
end
