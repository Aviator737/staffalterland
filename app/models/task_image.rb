class TaskImage < ApplicationRecord
  mount_uploader :image, TaskUploader
  belongs_to :task
end
