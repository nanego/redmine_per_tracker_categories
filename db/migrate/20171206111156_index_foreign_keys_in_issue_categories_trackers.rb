class IndexForeignKeysInIssueCategoriesTrackers < ActiveRecord::Migration[4.2]
  def change
    add_index :issue_categories_trackers, :issue_category_id
    add_index :issue_categories_trackers, :tracker_id
  end
end
