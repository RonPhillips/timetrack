class Activity < ActiveRecord::Base
  validates :name, :presence=>true
  validates :identifier, :uniqueness=>true
  def self.labels
    activities = self.all(:select=>"identifier,name, id", :order=>'name')
    out = activities.map do |activity|
       {:label=>"#{activity.identifier} #{activity.name}", :id=>activity.id}
    end
    out.to_json
  end
  def label
    "#{identifier} #{name}"
  end
end
