class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :from_date, :to_date, :number_of_persons, :room
  belongs_to :room
end
