class Address < ActiveRecord::Base
  belongs_to :location
  validates_presence_of :city
end
