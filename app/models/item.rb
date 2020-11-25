class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :price
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category
    validates :delivery_fee
    validates :item_status
    validates :ship_from_location
    validates :shipping_date
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :item_status
  belongs_to :ship_from_location
  belongs_to :shipping_date

end
