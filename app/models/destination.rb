class Destination < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_from

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}\-?\d{4}\z/, message: 'を入力してください' }
    validates :shipping_from_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :municipalities
    validates :address
    validates :telephone_number, length: { maximum: 11, message: 'は11文字以下で、ハイフンを入れないでください' }
  end
end
