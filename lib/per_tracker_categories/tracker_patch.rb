require_dependency 'tracker'

class Tracker

  has_and_belongs_to_many :issue_categories

end
