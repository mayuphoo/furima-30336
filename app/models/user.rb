class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :last_kana
    validates :first_kana
    validates :birthday
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze 
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
    validates :last_name, format: { with: VALID_NAME_REGEX }
    validates :first_name, format: { with: VALID_NAME_REGEX }
    VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
    validates :last_kana, format: { with: VALID_NAME_KANA_REGEX }
    validates :first_kana, format: { with: VALID_NAME_KANA_REGEX }  
  end





end
