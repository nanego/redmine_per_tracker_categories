require_dependency 'issue_category'

class IssueCategory
  include Redmine::SafeAttributes

  has_and_belongs_to_many :trackers

  safe_attributes :tracker_ids

end
