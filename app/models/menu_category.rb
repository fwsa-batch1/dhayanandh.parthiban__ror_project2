class MenuCategory < ApplicationRecord
  has_many :menu_items , dependent: :destroy
  validates :name, presence: true
  validates :name, :uniqueness => true

def self.updatemenustatus
  where("status = ?",true)
end
end
