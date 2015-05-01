require 'test_helper'

class EventSubmissionsControllerTest < ActionController::TestCase
  setup do
    @event_submission = event_submissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_submissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_submission" do
    assert_difference('EventSubmission.count') do
      post :create, event_submission: { account_id: @event_submission.account_id, event_id: @event_submission.event_id }
    end

    assert_redirected_to event_submission_path(assigns(:event_submission))
  end

  test "should show event_submission" do
    get :show, id: @event_submission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_submission
    assert_response :success
  end

  test "should update event_submission" do
    patch :update, id: @event_submission, event_submission: { account_id: @event_submission.account_id, event_id: @event_submission.event_id }
    assert_redirected_to event_submission_path(assigns(:event_submission))
  end

  test "should destroy event_submission" do
    assert_difference('EventSubmission.count', -1) do
      delete :destroy, id: @event_submission
    end

    assert_redirected_to event_submissions_path
  end
end
