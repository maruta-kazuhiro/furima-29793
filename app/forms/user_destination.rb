class UserDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_from_id, :municipalities, :address, :building, :telephone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}\-\d{4}\z/, message: 'is invalid. Input postal code' }
    validates :shipping_from_id, numericality: { other_than: 1, message: 'is invalid. You must select' }
    validates :municipalities
    validates :address
    validates :telephone_number, length: { maximum: 11, message: 'is invalid.Maximum 11 and no hyphen' },  numericality: { only_integer: true }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, shipping_from_id: shipping_from_id, municipalities: municipalities, address: address, building: building, telephone_number: telephone_number, order_id: order.id)
  end
end
