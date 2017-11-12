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
    session.delete(:user_id)
    p "trying to logout here"
    redirect_to root_path
  end

  private

  def invalid_login
     render component: 'Login', props: { errors: "Invalid e-mail or password. Please try again!" }
  end

  def user_params
    params.permit(:email, :password)
  end
end
