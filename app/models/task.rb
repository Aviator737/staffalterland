class Task < ActiveRecord::Base
  mount_uploader :title_image, TaskTitleUploader
  has_many :task_images
  accepts_nested_attributes_for :task_images
end
