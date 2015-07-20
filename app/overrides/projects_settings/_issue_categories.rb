Deface::Override.new :virtual_path => 'projects/settings/_issue_categories',
                     :name         => 'add-tracker-dynamic-filter',
                     :insert_before => 'table',
                     :partial      => 'issue_categories/filter_by_tracker'

# Table header
Deface::Override.new :virtual_path => 'projects/settings/_issue_categories',
                     :name         => 'add-tracker-header',
                     :insert_after => 'th:contains(":field_assigned_to")',
                     :text         => <<STRING
<th><%= l(:field_tracker_ids) %></th>
STRING

# Table content
Deface::Override.new :virtual_path => 'projects/settings/_issue_categories',
                     :name         => 'add-tracker-column',
                     :insert_before => 'td.buttons',
                     :text         => <<STRING
<td><%=h(category.trackers.map(&:name).join(', ')) if category.trackers.present? %></td>
STRING


