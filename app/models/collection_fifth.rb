class CollectionFifth < ActiveRecord::Base
  has_attached_file :image, :styles => { :thumb => "316x563"}, :default_url => "/assets/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
