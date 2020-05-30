class SessionsController < Devise::SessionsController
  respond_to :json

  def new
    super
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    if !session[:return_to].blank?
      redirect_to session[:return_to]
      session[:return_to] = nil
    else
      expiration_time = 1.hour.to_i
      render :json => { id: current_user.id, exp: expiration_time }
    end
  end

  private

  def respond_to_on_destroy
    head :ok
  end
end
