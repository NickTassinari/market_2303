class Vendor 
  attr_reader :name, :inventory 

  def initialize(name)
    @name = name 
    @inventory = {}
  end

  def check_stock(item)
    if inventory.include?(item)
      inventory[item]
    else  
      0
    end
  end

  def stock(item, item_count)
    inventory[item] = item_count 
  end
end