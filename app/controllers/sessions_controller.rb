class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(user_params[:email])
    return invalid_login unless @user

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect_to user_dashboard_path(@user)
    else
      invalid_login
    end
  end

  def destroy
    session[:user_id] = nil
    reset_session
    @current_user = nil
    p "trying to logout here"
    redirect_to root_path, status: 303
  end

  private

  def invalid_login
     render component: 'Login', props: { errors: "Invalid e-mail or password. Please try again!" }
  end

  def user_params
    params.permit(:email, :password)
  end
end
