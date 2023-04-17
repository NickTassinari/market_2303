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
    if inventory[item] == nil 
      inventory[item] = item_count
    else  
      inventory[item] += item_count
    end
  end
end