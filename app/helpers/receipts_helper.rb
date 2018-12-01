module ReceiptsHelper
  def index_active
    controller.action_name == 'index' ? 'active' : ''
  end

  def new_active
    controller.action_name == 'new' ? 'active' : ''
  end

  def options_for_products
    current_company.products.map do |product|
      ["#{product.name} (#{product.number})", product.id]
    end
  end

  def options_for_drivers
    current_company.users.drivers.map do |driver|
      ["#{driver.first_name} #{driver.last_name}", driver.id, {class: 'dropdown-item'}]
    end
  end

end
