class WebsitesUser
  include DataMapper::Resource

  property :website_id, Integer, :key => true, :min => 1
  property :user_id, Integer, :key => true, :min => 1
  property :comment, Text, :lazy => false
  
  
  belongs_to :website, :key => true
  belongs_to :user, Website, :key => true
end
