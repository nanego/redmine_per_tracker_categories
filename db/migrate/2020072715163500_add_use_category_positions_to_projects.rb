class AddUseCategoryPositionsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :use_category_positions, :boolean, default: false
  end
end
