require_dependency 'project'

class Project

  has_many :issue_categories, lambda {order(:position, :name)}, :dependent => :delete_all

end
