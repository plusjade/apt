class Website
  include DataMapper::Resource

  property :id, Serial
  property :domain, String
  property :url, String
  
  has n, :user_associations, WebsitesUser, :child_key => [:website_id]
  has n, :usee_associations, WebsitesUser, :child_key => [:user_id]
  
  has n, :users, self, :through => :user_associations, :via => :user
  has n, :usees, self, :through => :usee_associations, :via => :website

  validates_with_method :domain, :validate_domain
  validates_with_method :domain, :validate_url
  
  before :valid? do
    self.domain = Website.normalize_domain(self.domain)
    self.url = Website.normalize_url(self.url.blank? ? self.domain : self.url)
  end
  
  
  def self.first_by_domain(domain)
    domain = Website.normalize_domain(domain)
    
    domain ? self.first(:domain => domain) : nil
  end
  
    
  def usedby_data
    {
      :meta => {
        :type   => :usedby,
        :total  => self.user_associations.count
      },
      :websites => self.users_with_comments
    }
  end
  
  def uses_data
    {
      :meta => {
        :type => :uses,
        :total => self.usee_associations.count
      },
      :websites => self.usees_with_comments 
    }
  end
  

  def users_with_comments
    ids = []
    comments = {}
    user_associations.map do |w|
      ids.push(w.user_id)
      comments[w.user_id] = w.comment
    end
    
    websites = []
    Website.all(:id => ids).map do |w| 
      websites.push(w.attributes.merge(:comment_by => comments[w.id]))
    end

    websites
  end
  
  
  def usees_with_comments
    ids = []
    comments = {}
    usee_associations.map do |w|
      ids.push(w.website_id)
      comments[w.website_id] = w.comment
    end

    websites = []
    Website.all(:id => ids).map do |w| 
      websites.push(w.attributes.merge(:comment_on => comments[w.id]))
    end

    websites
  end
  

  def validate_domain
    if Website.normalize_domain(self.domain).nil?
      [ false, "Please provide a valid website domain." ]
    else
      return true
    end
  end
      
  def validate_url
    if Website.normalize_url(self.url).nil?
      [ false, "Please provide a valid website url." ]
    else
      return true
    end
  end
  
  def self.normalize_url(url)
    # url contains http:// or https://
    unless url =~ /(https|http)+(:\/\/)/i 
      url = 'http://' + url
    end  
    
    URI::parse(url).normalize.to_s
    
  rescue URI::InvalidURIError => e
    nil
  end
    
  def self.normalize_domain(url)
    url =  normalize_url(url)
    
    url ? URI.split(url)[2] : nil
    
  rescue URI::InvalidURIError => e
    nil      
  end
    
end
