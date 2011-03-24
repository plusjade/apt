class Website
  include DataMapper::Resource

  property :id, Serial
  property :domain, String
  property :url, String
  
  has n, :users_links, WebsitesUser, :child_key => [:website_id]
  has n, :usees_links, WebsitesUser, :child_key => [:user_id]
  
  has n, :users, self, :through => :users_links, :via => :user
  has n, :usees, self, :through => :usees_links, :via => :website

end
