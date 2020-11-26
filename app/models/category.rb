class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '衣服' },
    { id: 3, name: 'おもちゃ' },
    { id: 4, name: '本' },
    { id: 5, name: '音楽' },
    { id: 6, name: 'スポーツ' }
  ]
  
  include ActiveHash::Associations
  has_many :items
end
