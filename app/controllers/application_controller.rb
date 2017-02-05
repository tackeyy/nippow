require "application_responder"

class ApplicationController < ActionController::Base
  respond_to :html
  self.responder = ApplicationResponder

  before_action :require_login

  protect_from_forgery with: :exception

  private

  def not_authenticated
    redirect_to user_sign_in_path
  end
end
