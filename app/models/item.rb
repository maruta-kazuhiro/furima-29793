class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :date_of_shipment
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_from

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40, message: 'は最大４０文字までです。' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は半角数字で入力してください。価格は¥300から¥9,999,999までです' }
    validates :introduction, length: { maximum: 1000, message: 'は最大1,000文字までです。' }
    with_options numericality: { other_than: 1, message: 'を選択してください' } do
      validates :category_id
      validates :condition_id
      validates :shipping_fee_id
      validates :shipping_from_id
      validates :date_of_shipment_id
    end
  end
end
