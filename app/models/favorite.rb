class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :item

  #同じ商品への複数回のお気に入り登録を回避するために記述
  validates_uniquness_of :post_id, scope: :user_id
end
