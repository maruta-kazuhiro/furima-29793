class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :destination
  # attr_accessor :token

  # validates :token, presence: true
end
