class Activity < ActiveRecord::Base
  validates :name, :presence=>true
end
