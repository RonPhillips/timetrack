class Comment < ActiveRecord::Base
  
  before_create :set_previous_state
  after_create :set_task_state

  belongs_to :task
  belongs_to :user
  belongs_to :state
  belongs_to :previous_state, :class_name => "State"

  validates :text, :presence => true

  delegate :project, :to => :task
  
  private

  def set_previous_state
    self.previous_state = task.state
  end

  def set_task_state
    self.task.state = self.state
    self.task.save!
  end

end



