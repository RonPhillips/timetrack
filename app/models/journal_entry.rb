class JournalEntry < ActiveRecord::Base
  belongs_to :activity
  belongs_to :task
  belongs_to :user
  has_and_belongs_to_many :tags
  
  validates :duration, :presence=>true
  validates :activity, :presence=>true
  validates :user, :presence=>true
  
  def tag!(tagsparam)
    self.tags.clear
    Tag.find(tagsparam.split(',')).each do |newtag|
      self.tags << newtag
    end
  end

  def tagstring
    out = tags.map{|tag|tag.name}
    out.join(" ")
  end

end
