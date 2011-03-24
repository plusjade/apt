class GraphController < ApplicationController
  
  before_filter :load_website
  
  def profile
    render :json => @website
  end

  def usedby
    render :json => @website.usedby_data
  end
  
  def uses
    render :json => @website.uses_data
  end
  
  def load_website
    @website = Website.first(:domain => params[:domain])
    
    if @website.nil?
      @website = Website.new(:domain => params[:domain], :url => "http://#{params[:domain]}")
      render :json => @website
      return true
    end
    
  end
  
end
