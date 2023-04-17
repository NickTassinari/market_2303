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

  def total_items 
    total_items = []
      vendors.each  {|vendor|  total_items << vendor.inventory.keys}
    total_items = total_items.flatten.uniq 
  end

  def sorted_item_list
    total_items.map {|item| item.name}.sort 
  end
#helper method for total inventory
  def quantity_and_items 
    total_items = []
    vendors.each {|vendor| total_items << vendor.inventory}

    total_items = total_items.flatten.uniq 

    new_hash = {}
    total_items.each do |items|
      items.each do |item| 
        if new_hash.has_key?(item.first)
          new_hash[item.first] += item.last
        else  
          new_hash[item.first] = item.last 
        end
      end
    end
    new_hash
  end 
#helper method for total inventory
  def item_quantity(item)
    a = quantity_and_items
    a[item]
  end

  def total_inventory
    market_items = {}
    total_items.each do |item|
      market_items[item] = {quantity: item_quantity(item),
                            vendors: vendors_that_sell(item)}
      end                         
    market_items
  end 

  def overstocked_items
    found_items = total_inventory.find_all do |items|
      items[1].values.first > 50 && items[1].values.last.length > 1
    end.flatten 
    [found_items.first]
  end
end