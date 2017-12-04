class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     session[:user_id] = @user.id
  #     WelcomeMailer.welcome_email(@user).deliver
  #     redirect_to user_dashboard_path(@user)
  #   else
  #     invalid_register(@user)
  #   end
  # end

 def create
    skip_before_action :authorize_request, only: :create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  private

  def invalid_register(user)
     render component: 'Register', props: { errors: user.errors.full_messages }
  end

  def user_params
    params.permit(
      :first_name,
      :last_name,
      :phone_number,
      :email,
      :password,
      :password_confirmation)
  end
end
