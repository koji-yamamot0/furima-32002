class ShippingDate < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '2日以内に発送' },
    { id: 3, name: '2~4日以内に発送' },
    { id: 4, name: '4~7日以内に発送' }
  ]
  
  include ActiveHash::Associations
  has_many :items
end
