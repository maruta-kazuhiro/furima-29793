class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :date_of_shipment, :shipping_fee, :shipping_from

  with_options presence: true do
  validates :name
  validates :price, format: { with: /\A[0-9]+\z/, message:"is invalid.Please type using half-width characters" }, :numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999 } 
  validates :introduction
  validates :user, foreign_key:true
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :shipping_fee_id, numericality: { other_than: 1 } 
  validates :shipping_from_id, numericality: { other_than: 1 } 
  validates :date_of_shipment_id, numericality: { other_than: 1 } 
  end

end