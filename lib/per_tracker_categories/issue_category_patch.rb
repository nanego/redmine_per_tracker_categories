require_dependency 'issue_category'

class IssueCategory

  belongs_to :tracker

  safe_attributes 'tracker_id'

end
