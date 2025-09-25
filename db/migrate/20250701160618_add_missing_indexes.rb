class AddMissingIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :issue_categories_trackers, [:issue_category_id, :tracker_id], if_not_exists: true, name: "index_categories_trackers_on_issue_category_id_and_tracker_id"
  end
end
