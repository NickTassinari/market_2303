class Vendor 
  attr_reader :name, :inventory 

  def initialize(name)
    @name = name 
    # @inventory = {}
    @inventory = Hash.new(0)
  end

  # def check_stock(item)
  #   if inventory.include?(item)
  #     inventory[item]
  #   else  
  #     0
  #   end
  # end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, item_count)
    if inventory[item] == nil 
      inventory[item] = item_count
    else  
      inventory[item] += item_count
    end
  end

  def potential_revenue
    # @inventory.inject(0) {|total, inventory| total += inventory.first.price * inventory.last}
    @inventory.sum do |item, amount|
      item.price * amount
    end
    
  end
end