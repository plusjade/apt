require 'dm-rails/middleware/identity_map'
class ApplicationController < ActionController::Base
  use Rails::DataMapper::Middleware::IdentityMap
  protect_from_forgery

  rescue_from DataMapper::ObjectNotFoundError do |exception|
    render :text => exception
  end
  
  def default_url_options(options={})
    options[:format] = :iframe if request.format == :iframe
    options[:domain] = params[:domain]
    options
  end
end
