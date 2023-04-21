class Market 
  attr_reader :name, :vendors

  def initialize(name)
    @name = name 
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor 
  end

  def vendor_names 
    vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    vendors.find_all {|vendor| vendor.inventory.include?(item)}
  end

  def sorted_item_list
    vendors.flat_map do |vendor|
      vendor.inventory.keys.map do |item|
        item.name 
      end
    end.uniq.sort 
  end

  def total_inventory
    total = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        if total[item]
          total[item][:quantity] += quantity
        else  
          total[item] = {
            quantity: quantity,
            vendors: vendors_that_sell(item)
          }
        end
      end
    end
    total  
  end

  def overstocked_items
    total_inventory.select do |item, info|
      info[:quantity] > 50 && info[:vendors].length > 1
    end.keys 
  end
end