class Website
  include DataMapper::Resource

  property :id, Serial
  property :domain, String
  property :url, String
  
  has n, :users_links, WebsitesUser, :child_key => [:website_id]
  has n, :usees_links, WebsitesUser, :child_key => [:user_id]
  
  has n, :users, self, :through => :users_links, :via => :user
  has n, :usees, self, :through => :usees_links, :via => :website

  before :save do
    self.url = normalize_url(self.url.blank? ? self.domain : self.url)
  end


  def valid_url
    if normalize_url(self.website).nil?
      [ false, "Please provide a valid website url." ]
    else
      return true
    end
  end
  
  def normalize_url(url)
    # url contains http:// or https://
    unless url =~ /(https|http)+(:\/\/)/i 
      url = 'http://' + url
    end  
    url = URI::parse(url).normalize.to_s
    return url
  rescue URI::InvalidURIError => e
    return nil
  end
    
end
