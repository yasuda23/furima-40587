class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :city, :house_number, :item_id, :user_id
    validates :delivery_area_id, numericality: {other_than: 1 }
    validates :token
  end


  def save
    order = Order.create(item_id: item_id, user_id: user_id, )
    address = Address.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end

