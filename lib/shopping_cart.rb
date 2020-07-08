class ShoppingCart

  attr_reader :name, :capacity, :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity[0..1].to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    {name: name, capacity: capacity}
  end

  def total_number_of_products
    total = 0
    @products.each do |product|
      total += product.quantity
    end
    total
  end

  def is_full?
    if total_number_of_products >= @capacity
      true
    else
      false
    end
  end

  def products_by_category(category)
    pro_by_cat = []
    products.each do |product|
      if product.category == category
        pro_by_cat << product
      end
    end
    pro_by_cat
  end

  def percentage_occupied
    percent = total_number_of_products.to_f * 10 / capacity.to_f * 10
    percent.round(2)
  end

  def sorted_products_by_quantity
    pro_by_quan = []
    counter = 0
    30.times do
      products.find do |product|
        if product.quantity < counter
          pro_by_quan << product unless pro_by_quan.include?(product)
        end
      end
      counter += 1
    end
    pro_by_quan
  end

  def product_breakdown
    products_hash = {}
    products.each do |product|
      if products_hash[product.category] == nil
        products_hash[product.category] = [product]
      else
        products_hash[product.category] << product
      end
    end
    products_hash
  end
end
