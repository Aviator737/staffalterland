require 'test_helper'

class TaskImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_image = task_images(:one)
  end

  test "should get index" do
    get task_images_url
    assert_response :success
  end

  test "should get new" do
    get new_task_image_url
    assert_response :success
  end

  test "should create task_image" do
    assert_difference('TaskImage.count') do
      post task_images_url, params: { task_image: { image: @task_image.image, task_id: @task_image.task_id } }
    end

    assert_redirected_to task_image_url(TaskImage.last)
  end

  test "should show task_image" do
    get task_image_url(@task_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_image_url(@task_image)
    assert_response :success
  end

  test "should update task_image" do
    patch task_image_url(@task_image), params: { task_image: { image: @task_image.image, task_id: @task_image.task_id } }
    assert_redirected_to task_image_url(@task_image)
  end

  test "should destroy task_image" do
    assert_difference('TaskImage.count', -1) do
      delete task_image_url(@task_image)
    end

    assert_redirected_to task_images_url
  end
end
