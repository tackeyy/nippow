require 'test_helper'

class Admin::OrganizationsControllerTest < ActionController::TestCase
  setup do
    @organization = organizations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post :create, organization: { name: @organization.name, status: @organization.status }
    end

    assert_redirected_to admin_organization_path(assigns(:organization))
  end

  test "should show organization" do
    get :show, id: @organization
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organization
    assert_response :success
  end

  test "should update organization" do
    patch :update, id: @organization, organization: { name: @organization.name, status: @organization.status }
    assert_redirected_to admin_organization_path(assigns(:organization))
  end

  test "should destroy organization" do
    assert_difference('Organization.count', -1) do
      delete :destroy, id: @organization
    end

    assert_redirected_to admin_organizations_path
  end
end
