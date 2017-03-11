class RepositoriesController < ApplicationController
  before_action :set_repository, only: [:destroy]

  # GET /repositories
  def index
    @repositories = Repository.github_repos(current_client.repos)
  end

  # POST /repositories
  def create
    @repository = Repository.new(repository_params)

    @repository.save
    respond_with @repository, location: repositories_url
  end

  # DELETE /repositories/1
  def destroy
    @repository.destroy
    respond_with @repository, location: repositories_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_repository
    @repository = Repository.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def repository_params
    params.permit(:organization_id, :repo_id, :name)
  end
end
