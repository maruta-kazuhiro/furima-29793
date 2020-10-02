class Destination < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_from

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}\-?\d{4}\z/, message: 'is invalid. Input postal code.' }
    validates :shipping_from_id, numericality: { other_than: 1, message: 'is invalid. You must select' }
    validates :municipalities
    validates :address
    validates :telephone_number, length: { maximum: 11, message: 'is invalid.Maximum 11 and no "-".' }
  end
end
