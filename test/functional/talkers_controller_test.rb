require 'test_helper'

class TalkersControllerTest < ActionController::TestCase
  setup do
    @talker = talkers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:talkers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create talker" do
    assert_difference('Talker.count') do
      post :create, talker: { blurb: @talker.blurb, producer: @talker.producer, product: @talker.product }
    end

    assert_redirected_to talker_path(assigns(:talker))
  end

  test "should show talker" do
    get :show, id: @talker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @talker
    assert_response :success
  end

  test "should update talker" do
    put :update, id: @talker, talker: { blurb: @talker.blurb, producer: @talker.producer, product: @talker.product }
    assert_redirected_to talker_path(assigns(:talker))
  end

  test "should destroy talker" do
    assert_difference('Talker.count', -1) do
      delete :destroy, id: @talker
    end

    assert_redirected_to talkers_path
  end
end
