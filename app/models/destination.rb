class Destination < ApplicationRecord
  belongs_to :purchaser

  with_options presence: { message: "を入力してください"} do
    validates :postal
    validates :prefecture_id
    validates :municipalities
    validates :addres
    validates :telephone_number
  end

  validates :telephone_number, format: { with: /\A[0-9]\d+\z/, message: "は半角数字で入力してください" }
                             , length: { maximum: 11, message: "は11文字以内にしてください" }
  
  validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
end
