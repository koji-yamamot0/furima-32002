class PurchaserDestination
  include ActiveModel::Model
  # attr_accessor :token
  attr_accessor :user_id, :item_id, :postal, :prefecture_id, :municipalities, :address, :building, :telephone_number
  
  with_options presence: { message: "を入力してください"} do
    validates :postal
    validates :municipalities
    validates :address
    validates :telephone_number
    # validates :token
  end

  with_options presence: true, numericality: { other_than: 1 , message: 'を選択してください' } do
    validates :prefecture_id
  end

  validates :telephone_number, format: { with: /\A[0-9]\d+\z/, message: "は半角数字で入力してください" }, 
                               length: { maximum: 11, message: "は11文字以内にしてください" }
  
  validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/, message: "は-を含めて入力してください" }

  def save
    purchaser = Purchaser.create( user_id: user_id, item_id: item_id )
    Destination.create( postal: postal, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building,telephone_number: telephone_number, purchaser_id: purchaser.id)
  end
end