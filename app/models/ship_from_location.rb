class ShipFromLocation < ActiveHash::Base
  self.data = []
  include ActiveHash::Associations
  has_many :items
end
