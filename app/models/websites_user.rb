class WebsitesUser
  include DataMapper::Resource

  property :website_id, Integer, :key => true, :min => 1
  property :user_id, Integer, :key => true, :min => 1

  belongs_to :website, :key => true
  belongs_to :user, Website, :key => true
end
