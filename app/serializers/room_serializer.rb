class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :image, :description, :beds, :user_id, :price
  has_many :reservations
end
