class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    VALID_KANJI = /\A[ぁ-んァ-ン一-龥]/.freeze
    VALID_KATAKANA = /\A[ァ-ヶー－]+\z/.freeze
    validates :nickname
    validates :family_name, format: { with: VALID_KANJI, message: 'は全角で入力してください' }
    validates :first_name, format: { with: VALID_KANJI, message: 'は全角で入力してください' }
    validates :family_name_kana, format: { with: VALID_KATAKANA, message: 'は全角カタカナで入力してください' }
    validates :first_name_kana, format: { with: VALID_KATAKANA, message: 'は全角カタカナで入力してください' }
    validates :birthday
  end
  validates :password, length: { minimum: 6, message: 'は６文字以上入力してください。' }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/, message: 'は半角英数字を両方入力してください' }
end
