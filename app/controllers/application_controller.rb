require "application_responder"

class ApplicationController < ActionController::Base
  respond_to :html
  self.responder = ApplicationResponder

  helper_method :current_client

  before_action :require_login

  protect_from_forgery with: :exception

  def current_client
    return @current_client if defined?(@current_client)
    @current_client = Octokit::Client.new(access_token: current_user.token)
  end

  private

  def not_authenticated
    redirect_to sign_in_path
  end
end
