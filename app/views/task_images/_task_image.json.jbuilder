json.extract! task_image, :id, :task_id, :image, :created_at, :updated_at
json.url task_image_url(task_image, format: :json)