class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    VALID_KANJI = /\A[ぁ-んァ-ン一-龥]/.freeze
    VALID_KATAKANA = /\A[ァ-ヶー－]+\z/.freeze
    validates :nickname
    validates :family_name, format: { with: VALID_KANJI, message: 'is invalid. Input full-width characters.' }
    validates :first_name, format: { with: VALID_KANJI, message: 'is invalid. Input full-width characters.' }
    validates :family_name_kana, format: { with: VALID_KATAKANA, message: 'is invalid. Input full-width katakana characters.' }
    validates :first_name_kana, format: { with: VALID_KATAKANA, message: 'is invalid. Input full-width katakana characters.' }
    validates :birthday
  end
  validates :password, length: { minimum: 6, message: 'is invalid. Minimum 6.'}, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/, message: 'is invalid. Use half-width alphanumeric both.'}
end
