class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :state
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :tags
  validates :title, :presence => true
  validates :description, :presence => true, :length=>{:minimum=>10}
  
  def tag!(tags)
    tags = tags.split(" ").map do |tag|
      Tag.find_or_create_by_name(tag)
    end
    self.tags << tags
  end
  
  def tagstring
    out = tags.map{|tag|tag.name}
    out.nil? ? '' : out.join(', ')
  end
  
end
