class AddTrackerIdToIssueCategories < ActiveRecord::Migration
  def change
    add_column :issue_categories, :tracker_id, :integer, :default => nil, :null => true
    add_index "issue_categories", ["tracker_id"], name: "issue_categories_tracker_id", using: :btree
  end
end
