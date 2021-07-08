class MenuItem < ApplicationRecord
  belongs_to :menu_category
  validates :name, presence: true
  validates :name, :uniqueness => true
  validates :price, presence: true , numericality:{greater_than:0}

  def self.updateitemstatus
    where("status = ?",true)
  end
end
