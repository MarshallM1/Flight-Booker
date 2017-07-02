class Flight < ApplicationRecord
	belongs_to :origin, class_name:'Airport'
	belongs_to :destination, class_name:'Airport'
	has_many :bookings
	has_many :passengers, through: :bookings
	validates :origin, presence: true
  validates :destination, presence: true
  validate :origin_and_destination_unique

  private
  	def origin_and_destination_unique
  		if origin_id == destination_id
      	errors.add(:origin_id, "and destination ids can't be the same.")
      	errors.add(:destination_id, "and origin ids can't be the same.")
    	end
  	end
end
