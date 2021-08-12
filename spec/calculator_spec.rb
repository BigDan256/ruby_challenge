# frozen_string_literal: true

require 'calculator'

RSpec.describe Calculator, '#total' do
  context 'adding' do
    it 'four, twenty times' do
      calculator = Calculator.new
      20.times { calculator.add(4) }
      expect(calculator.total).to eq 80
    end
  end
end
