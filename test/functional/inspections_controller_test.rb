require 'test_helper'

class InspectionsControllerTest < ActionController::TestCase
  setup do
    @inspection = inspections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inspections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inspection" do
    assert_difference('Inspection.count') do
      post :create, inspection: { agent: @inspection.agent, code: @inspection.code, comments: @inspection.comments, enrollment: @inspection.enrollment, gender: @inspection.gender, inspection_date: @inspection.inspection_date, the_geom: @inspection.the_geom, transmitter: @inspection.transmitter }
    end

    assert_redirected_to inspections_path
  end

  test "should show inspection" do
    get :show, id: @inspection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inspection
    assert_response :success
  end

  test "should update inspection" do
    put :update, id: @inspection, inspection: { agent: @inspection.agent, code: @inspection.code, comments: @inspection.comments, enrollment: @inspection.enrollment, gender: @inspection.gender, inspection_date: @inspection.inspection_date, the_geom: @inspection.the_geom, transmitter: @inspection.transmitter }
    
    assert_redirected_to inspections_path
  end

  test "should destroy inspection" do
    assert_difference('Inspection.count', -1) do
      delete :destroy, id: @inspection
    end

    assert_redirected_to inspections_path
  end
end
