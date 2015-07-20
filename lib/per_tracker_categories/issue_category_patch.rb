require_dependency 'issue_category'

class IssueCategory

  has_and_belongs_to_many :trackers

  safe_attributes :tracker_ids

end
