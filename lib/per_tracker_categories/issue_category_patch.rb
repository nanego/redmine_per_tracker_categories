module PerTrackerCategories::IssueCategoryPatch

  def self.included(base)
    base.class_eval do
      has_and_belongs_to_many :trackers
    end
  end

end

class IssueCategory
  include Redmine::SafeAttributes
  include PerTrackerCategories::IssueCategoryPatch
  safe_attributes :tracker_ids, :position
  acts_as_positioned :scope => :project_id
end
