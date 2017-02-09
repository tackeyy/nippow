class SignInController < ApplicationController
  layout 'auth'

  skip_before_action :require_login

  def show
    @user = User.new
  end
end
