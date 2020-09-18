class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nickname
  validates :family_name,  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
  validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
  validates :first_name_kana , format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
  validates :birthday
  end
  validates :email, uniqueness: { case_sensitive: true },  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/, message: "is invalid. Include @." }
  validates :password, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/,  message: "is invalid. Minimum 6."}
  
end
