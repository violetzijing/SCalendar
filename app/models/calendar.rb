class Calendar < ActiveRecord::Base
  validates :tips, pressence: true

  has_many :accu_times
end
