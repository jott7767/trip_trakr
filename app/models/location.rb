class Location < ActiveRecord::Base
  belongs_to :trip
  has_one :address
  validates_presence_of :state
end
