class RegistrationsController < Devise::RegistrationsController

  def create

    domain = Website.normalize_domain(params[:website])
    @website = Website.first_or_create(:domain => domain)
    
    params[:account][:email] = params[:email_name].to_s + "@#{domain}"
    
    build_resource

    resource.website = @website

    if resource.save

      if resource.active?
        set_flash_message :notice, :signed_up
        sign_in_and_redirect(resource_name, resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive_message.to_s
        expire_session_data_after_sign_in!
        redirect_to after_inactive_sign_up_path_for(resource)
      end

    else
      clean_up_passwords(resource)
      render :action => :new
    end

  end

end
