class Trip < ActiveRecord::Base
  has_many :locations, dependent: :destroy
  validates_presence_of :name  #message: 'needs to be...'
  validates_presence_of :start_date
  validates_presence_of :end_date
end
