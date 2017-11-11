class SessionsController < Devise::SessionsController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(user_params[:email])
    return invalid_login unless @user

    if @user.valid_password?(user_params[:password])
      sign_in :user, @user
      redirect_to user_dashboard_path(@user)
    else
      invalid_login
    end
  end

  def destroy
    sign_out(@user)
    render json: {success: true}
  end

  private

  def invalid_login
     render component: 'Login', props: { errors: "Invalid e-mail or password. Please try again!" }
  end

  def user_params
    params.permit(:email, :password)
  end
end
