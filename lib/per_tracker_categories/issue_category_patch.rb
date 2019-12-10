require_dependency 'issue_category'

class IssueCategory
  include Redmine::SafeAttributes

  acts_as_positioned :scope => :project_id

  has_and_belongs_to_many :trackers

  safe_attributes :tracker_ids, :position

end
