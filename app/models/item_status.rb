class ItemStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '新品' },
    { id: 3, name: '未使用に近い' },
    { id: 4, name: '傷、汚れなし' },
    { id: 5, name: '目立った傷、汚れがある' },
    { id: 6, name: '状態が悪い' }
  ]
  include ActiveHash::Associations
  has_many :items
end
