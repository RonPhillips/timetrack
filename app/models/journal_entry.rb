class JournalEntry < ActiveRecord::Base
  belongs_to :activity
  belongs_to :task
  belongs_to :user
  has_and_belongs_to_many :tags
  
  validates :duration, :presence=>true
  
  def tag!(tags)
    thetags = tags.split(" ").map do |name|
      Tag.find_by_name(name)
    end
    self.tags << thetags
  end
  
  def tagstring
    out = tags.map{|tag|tag.name}
    out.join(", ")
  end

end
