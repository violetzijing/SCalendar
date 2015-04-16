class AccuTime < ActiveRecord::Base
  validates :time, presence: true

  belongs_to :calendar
  has_one :weather
  
  attr_reader :time
end
