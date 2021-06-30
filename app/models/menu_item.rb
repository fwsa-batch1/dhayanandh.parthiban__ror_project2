class MenuItem < ApplicationRecord
  belongs_to :menu_category
  validates :name, presence: true
  validates :name, :uniqueness => true

  def self.completed
    all.where(status: false)
  end
end
