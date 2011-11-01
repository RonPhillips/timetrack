class Project < ActiveRecord::Base
  has_many :tasks
  validates :name, :presence=>true
end
