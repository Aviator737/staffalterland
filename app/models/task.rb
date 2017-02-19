class Task < ActiveRecord::Base
  has_many :task_images
  accepts_nested_attributes_for :task_images
end
