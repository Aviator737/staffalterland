class AddTitleTaskToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :title_image, :string
  end
end
