Deface::Override.new :virtual_path => 'issues/_attributes',
                     :name         => 'replace-categories-according-to-tracker',
                     :replace      => 'erb[loud]:contains(":category_id")',
                     :text         => <<STRING
<%= f.select :category_id, (@issue.project.issue_categories.reject{|c| c.tracker.present? && c.tracker != @issue.tracker }.collect {|c| [c.name, c.id]}), :include_blank => true, :required => @issue.required_attribute?('category_id') %>
STRING
