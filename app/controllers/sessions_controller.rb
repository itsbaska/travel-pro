class SessionsController < ApplicationController
  def new
    @user = "sessionasdfasdfads"
  end

  def create
    @user = User.new
  end
end
