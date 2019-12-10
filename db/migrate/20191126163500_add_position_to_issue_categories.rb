class AddPositionToIssueCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :issue_categories, :position, :integer, :default => 1
  end
end
