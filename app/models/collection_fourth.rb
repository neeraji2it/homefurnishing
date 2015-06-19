class CollectionFourth < ActiveRecord::Base
  has_attached_file :image, :styles => { :thumb => "313x332"}, :default_url => "/assets/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
