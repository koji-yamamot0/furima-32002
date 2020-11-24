class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,         presence: true
  validates_format_of :email , with: /@+/, message: "には@を入れてください"

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: VALID_PASSWORD_REGEX, message: 'は英字と数字を含む必要があります'
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角で入力してください' } do
    validates :family_name
    validates :first_name
  end
  
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'は全角カタカナで入力してください'} do
    validates :kana_family
    validates :kana_first
  end
  validates :birthday,         presence: true
end
