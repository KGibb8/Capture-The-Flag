class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  clear_respond_to
  respond_to :json

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    # super
    binding.pry
    user = User.find_by(email: sign_in_params[:email])
    if user
      if sign_in user
        # respond_to do |format|
          # format.json { render json: user }
        # end
        if remotipart_submitted?
          user.avatar = user.avatar.thumb.url
          binding.pry
          render json: user
        end
        # render user.to_json, content_type: "application/json"
      else
        # Devise must be able to do this for me?
        # response = HttpResponse("Incorrect Password", mimetype="text/html")
        render json: "Incorrect Password"
      end
    else
      render json: "User does not exist. Please create an account."
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || games_path 
  end
end
