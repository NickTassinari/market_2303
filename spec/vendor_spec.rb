require './lib/vendor'
require './lib/item'

RSpec.describe Vendor do 
  describe '#initialize' do 
    it 'exists and has readable attributes' do 
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      vendor = Vendor.new("Rocky Mountain Fresh")

      expect(vendor.name).to eq("Rocky Mountain Fresh")
      expect(vendor.inventory).to eq({})
    end
  end
end