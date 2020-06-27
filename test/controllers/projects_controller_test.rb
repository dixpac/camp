require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get projects_index_url
    assert_response :success
  end
end
