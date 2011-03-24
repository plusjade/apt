class GraphController < ApplicationController
  
  before_filter :load_website
  
  def profile
    render :json => @website
  end

  def usedby
    @profiles = ActiveSupport::JSON.decode(@website.users.to_json)
    
    render :json =>  {
      :meta => {:type => :usedby, :total => @website.users.count},
      :websites => @profiles
    }
  end
  
  def uses
    @profiles = ActiveSupport::JSON.decode(@website.usees.to_json)

    render :json => {
      :meta => {:type => :uses, :total => @website.usees.count},
      :websites => @profiles
    }
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
