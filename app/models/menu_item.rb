class MenuItem < ApplicationRecord
  belongs_to :menu_category
  validates :name, presence: true
  validates :name, :uniqueness => true

  def self.updateitemstatus
    where("status = ?",true)
  end
end
