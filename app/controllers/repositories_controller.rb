class Admin::RepositoriesController < ApplicationController
  before_action :set_repository, only: [:show, :edit, :update, :destroy]

  # GET /admin/repositories
  def index
    @repositories = Repository.all
  end

  # GET /admin/repositories/1
  def show
  end

  # GET /admin/repositories/new
  def new
    @repository = Repository.new
  end

  # GET /admin/repositories/1/edit
  def edit
  end

  # POST /admin/repositories
  def create
    @repository = Repository.new(repository_params)

    if @repository.save
      redirect_to [:admin, @repository], notice: 'Repository was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /admin/repositories/1
  def update
    if @repository.update(repository_params)
      redirect_to [:admin, @repository], notice: 'Repository was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /admin/repositories/1
  def destroy
    @repository.destroy
    redirect_to admin_repositories_url, notice: 'Repository was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repository
      @repository = Repository.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def repository_params
      params.require(:repository).permit(:name, :status, :deleted_at)
    end
end
