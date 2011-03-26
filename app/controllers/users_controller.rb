class UsersController < ApplicationController

  before_filter :load_website
  
  # add sanitizer
  def create
    domain = Website.normalize_domain(params[:user][:domain])
    render :text => "invalid domain" and return unless domain

    @user = Website.first_or_create(:domain => domain)
    
    @relationship = @website.user_associations.first(:user => @user)
    
    if @relationship
      @relationship.comment =  params[:user][:comment]
    else
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
