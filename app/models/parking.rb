class Parking < ActiveHash::Base
  self.data = [
    {id: 1, name: '--'},
    {id: 2, name: '有'},
    {id: 3, name: '無'}
  ]

  include ActiveHash::Associations
  has_many :shops
end