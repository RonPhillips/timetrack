class JournalEntry < ActiveRecord::Base
  belongs_to :activity
  belongs_to :task
  belongs_to :user
  has_and_belongs_to_many :tags
  
  validates :duration, :presence=>true
  
#  def tag!(tagnames)
#    self.tags.clear
#    tagnames.split(" ").each do |name|
#      newtag = Tag.find_by_name(name)
#      self.tags << newtag
#    end
#  end
  def tag!(tagstring)
    self.tags.clear
    tagset = tagstring.split(" ").map do |tagname|
      Tag.find_by_name(tagname)
    end
    self.tags << tagset
  end

  def tagstring
    out = tags.map{|tag|tag.name}
    out.join(" ")
  end

end
