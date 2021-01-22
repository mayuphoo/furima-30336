class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/
  validates :password, format: { with:VALID_PASSWORD_REGEX}
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name, format: { with:VALID_NAME_REGEX}
  validates :first_name, format: { with:VALID_NAME_REGEX}
  validates :last_kana, presence: true
  validates :first_kana, presence: true
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :last_kana, format: { with: VALID_NAME_KANA_REGEX}
  validates :first_kana, format: { with: VALID_NAME_KANA_REGEX}
  validates :birthday, presence: true
end