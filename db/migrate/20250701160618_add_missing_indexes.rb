class AddMissingIndexes < ActiveRecord::Migration[7.2]
  def change
    add_index :issue_categories_trackers, [:issue_category_id, :tracker_id], if_not_exists: true
  end
end
