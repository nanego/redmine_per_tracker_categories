module PerTrackerCategories::IssueCategoryPatch

end

class IssueCategory
  include PerTrackerCategories::IssueCategoryPatch
  include Redmine::SafeAttributes
  safe_attributes :tracker_ids, :position
  acts_as_positioned :scope => :project_id
  has_and_belongs_to_many :trackers
end
