class SessionsController < Devise::SessionsController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(user_params[:email])
    return invalid_login_attempt unless @user

    if @user.valid_password?(user_params[:password])
      p "I AM LOGGED IN"
      sign_in :user, @user
      redirect_to user_dashboard_path(@user)
    else
      p "I AM NOT LOGGED IN"
      invalid_login_attempt
    end
  end

  def destroy
    sign_out(@user)
    render json: {success: true}
  end

  private

  def invalid_login_attempt
    warden.custom_failure!
    render json: {error: 'Invalid login attempt'}, status: :unprocessable_entity
  end

  def user_params
    params.permit(:email, :password)
  end
end
