class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]

    if @user = login_from(provider)
      flash[:notice] = "You have successfully sign in your #{provider.titleize} account."
      return redirect_to root_url
    end

    @user = create_from(provider)
    auto_login(@user)

    flash[:notice] = "You have successfully sign in your #{provider.titleize} account."
    redirect_to root_url
  end

  def destroy
    provider = params[:provider]

    authentication = current_user.authentications.find_by_provider(provider)
    if authentication.present?
      current_user.destroy!
      logout
      flash[:notice] = "You have successfully unlinked your #{provider.titleize} account."
    else
      flash[:alert] = "You do not currently have a linked #{provider.titleize} account."
    end

    redirect_to root_path
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end
end
