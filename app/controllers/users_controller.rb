class UsersController < ApplicationController

  before_filter :load_website
  
  # ToDO: normalize domain
  # add sanitizer
  def create
    
    @user = Website.first_or_create(:domain => params[:user][:domain])
    
    @relationship = @website.user_associations.first(:user => @user)
    
    if @relationship
      @relationship.comment =  params[:user][:comment]
    else
      puts "create new"
      @relationship = @website.user_associations.new({
        :user     => @user,
        :comment  => params[:user][:comment]
      })      
    end
    
    if @relationship.save
      flash[:notice] = "User added!"
      redirect_to v1_domain_index_path
    end


  end


end
