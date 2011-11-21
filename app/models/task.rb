class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :state
  belongs_to :user
  has_many :comments
  validates :title, :presence => true
  validates :description, :presence => true, :length=>{:minimum=>10}
end
