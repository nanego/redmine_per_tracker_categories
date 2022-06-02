require_dependency 'project'

class Project

  safe_attributes "use_category_positions"

  has_many :issue_categories, lambda {order(:position, :name)}, :dependent => :destroy

  # Copies issue categories from +project+
  def copy_issue_categories(project)
    project.issue_categories.each do |issue_category|
      new_issue_category = IssueCategory.new
      new_issue_category.attributes = issue_category.attributes.dup.except("id", "project_id")

      # Also copy associated trackers
      new_issue_category.tracker_ids = issue_category.tracker_ids

      self.issue_categories << new_issue_category
    end
  end

end
