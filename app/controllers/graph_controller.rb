class GraphController < ApplicationController
  
  before_filter :load_website
  
  def index
    if current_account
      @user_website = current_account.website
      @user_association = @website.user_associations.first(:user_id => @user_website.id)
    end
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
