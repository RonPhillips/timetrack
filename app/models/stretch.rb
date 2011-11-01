class Stretch < ActiveRecord::Base
  validates :duration, :presence=>true
end
