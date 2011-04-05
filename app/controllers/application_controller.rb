require 'dm-rails/middleware/identity_map'
class ApplicationController < ActionController::Base
  use Rails::DataMapper::Middleware::IdentityMap
  protect_from_forgery

  rescue_from DataMapper::ObjectNotFoundError do |exception|
    render :text => exception
  end


  def load_website
    @website = Website.first(:domain => params[:domain])
    
    if @website.nil?
      @website = Website.new(:domain => params[:domain], :url => "http://#{params[:domain]}")
      #render :json => @website
      #return true
    end
    
  end
  
  def account_root_path
    v1_domain_index_path(current_account.domain)
  end
    
    
  def default_url_options(options={})
    options[:format] = :iframe if request.format == :iframe
    options[:domain] = params[:domain]
    options
  end
end
