class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: { message: 'を入力してください' } do
    validates :title
    validates :text
    validates :price
    validates :price
  end
  validates :text, length: { maximum: 40, message: 'は40文字以下にして下さい' }
  validates :title, length: { maximum: 1000, message: 'は1000文字以内にしてください' }
  validates :image , presence: { message: 'を添付してください'}

  with_options presence: true, numericality: { other_than: 1 , message: 'を選択してください' } do
    validates :category_id
    validates :delivery_fee_id
    validates :item_status_id
    validates :ship_from_location_id
    validates :shipping_date_id
  end
  validates :price, format: { with: /\A[0-9]\d+\z/,  message: 'は半角数字で入力してください' } ,
                    inclusion: { in: 300..9999999 , message: 'は指定範囲内に設定してください' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :item_status
  belongs_to :ship_from_location
  belongs_to :shipping_date

end
