class UserDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_from_id, :municipalities, :address, :building, :telephone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}\-\d{4}\z/, message: 'を入力してください' }
    validates :shipping_from_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :municipalities
    validates :address
    validates :telephone_number, length: { maximum: 11, message: 'は11文字以下で、ハイフンを入れないでください' },  numericality: { only_integer: true }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, shipping_from_id: shipping_from_id, municipalities: municipalities, address: address, building: building, telephone_number: telephone_number, order_id: order.id)
  end
end
