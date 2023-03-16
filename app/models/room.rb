class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, format: { with: /[a-zA-Z]/ }, presence: true
  validates :beds, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :description, length: { maximum: 250 }, presence: true
  validates :image, presence: true
  validates :city, presence: true
  validates :user_id, presence: true
end
