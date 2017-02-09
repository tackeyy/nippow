class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:destroy]

  # GET /organizations
  def index
    @organizations = Organization.github_organizations(current_client.organizations)
  end

  # POST /organizations
  def create
    @organization = Organization.new(organization_params)

    @organization.save
    respond_with @organization, location: organizations_url
  end

  # DELETE /organizations/1
  def destroy
    @organization.destroy
    respond_with @organization, location: organizations_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = Organization.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def organization_params
    params.permit(:id, :organization_id, :name)
  end
end
