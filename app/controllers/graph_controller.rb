class GraphController < ApplicationController
  
  before_filter :load_website
  
  def index
    
  end
  
  def profile
    render :json => @website
  end

  def usedby
    render :json => @website.usedby_data
  end
  
  def uses
    render :json => @website.uses_data
  end
  
end
