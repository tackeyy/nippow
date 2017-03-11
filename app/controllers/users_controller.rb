class UsersController < ApplicationController
  def show
    @pulls = Organization.all_with_pulls(current_client)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
