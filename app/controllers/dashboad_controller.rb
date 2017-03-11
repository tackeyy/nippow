class DashboadController < ApplicationController
  def index
    @pulls = Organization.all_with_pulls(current_client)
  end
end
