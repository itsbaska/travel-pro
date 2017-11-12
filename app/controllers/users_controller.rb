class UsersController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_dashboard_path(@user)
    else
      invalid_register(@user)
    end
  end

  private

  def invalid_register(user)
     render component: 'Register', props: { errors: user.errors.full_messages }
  end

  def user_params
     params.permit(:first_name, :last_name, :phone_number, :email, :password, :password_confirmation)
  end
end
