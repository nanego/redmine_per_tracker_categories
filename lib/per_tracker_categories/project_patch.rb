module PerTrackerCategories::ProjectPatch

  def self.prepended(base)
    base.class_eval do
      has_many :issue_categories, lambda { order(:position, :name) }, :dependent => :destroy
      safe_attributes "use_category_positions"
    end
  end

  # Copies issue categories from +project+
  def copy_issue_categories(project)
    project.issue_categories.each do |issue_category|
      new_issue_category = IssueCategory.new
      new_issue_category.attributes = issue_category.attributes.dup.except("id", "project_id")

      # Also copy associated trackers
      new_issue_category.tracker_ids = issue_category.tracker_ids

      self.issue_categories << new_issue_category
      self.use_category_positions = project.use_category_positions
    end
  end

end

Project.prepend PerTrackerCategories::ProjectPatch
