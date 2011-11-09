class Project < ActiveRecord::Base
  has_many :tasks, :dependent=>:destroy 

  validates :name, :presence => true, :uniqueness => true

  has_many :permissions, :as => :permissions_apply

  scope :readable_by, lambda { |user|
    joins(:permissions).where(:permissions => { :action => "view",:user_id => user.id })
  }
  
  def self.for(user)
    user.admin? ? Project : Project.readable_by(user)
  end
  
end
