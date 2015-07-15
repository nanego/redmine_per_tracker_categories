Deface::Override.new :virtual_path => 'issues/_attributes',
                     :name         => 'replace-categories-according-to-tracker',
                     :replace      => 'erb[loud]:contains(":category_id")',
                     :text         => <<STRING
<%= f.select :category_id, (@issue.project.issue_categories.reject{|c| c.tracker.present? && c.tracker != @issue.tracker }.collect {|c| [c.name, c.id]}), :include_blank => true, :required => @issue.required_attribute?('category_id') %>
STRING

# Only useful if the 'category' field has been moved to the _form partial by another plugin
Deface::Override.new :virtual_path => 'issues/_form',
                     :name         => 'replace-categories-according-to-tracker-in-form-partial',
                     :replace      => 'erb[loud]:contains(":category_id")',
                     :text         => <<STRING
<%= f.select :category_id, (@issue.project.issue_categories.reject{|c| c.tracker.present? && c.tracker != @issue.tracker }.collect {|c| [c.name, c.id]}), :include_blank => true, :required => @issue.required_attribute?('category_id') %>
STRING

