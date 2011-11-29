class JournalEntry < ActiveRecord::Base
  belongs_to :activity
  belongs_to :task
  belongs_to :user
  
  validates :duration, :presence=>true
end
