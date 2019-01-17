class CreateIssueCategoriesTrackersTable < ActiveRecord::Migration[4.2]
  def change
    create_table :issue_categories_trackers, :id => false do |t|
      t.belongs_to :issue_category
      t.belongs_to :tracker
    end
  end
end
