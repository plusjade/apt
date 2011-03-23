class GraphController < ApplicationController

  before_filter :blah
  
  def blah
    @profile = {
      :domain => params[:domain],
      :url => "http://api.pluspanda.com",
      :logo => "asdfasd",
      :comment => "jellopo"
    }    
  end
  
  def profile
    render :json => @profile
  end

  def uses
    render :json => {:uses => [@profile]}
  end
  
  
  def usedby
    render :json => {:usedby => [@profile, @profile]}
  end
  
end
