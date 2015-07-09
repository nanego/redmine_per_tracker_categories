# Table header
Deface::Override.new :virtual_path => 'projects/settings/_issue_categories',
                     :name         => 'add-tracker-header',
                     :insert_after => 'th:contains(":field_assigned_to")',
                     :text         => <<STRING
<th><%= l(:field_tracker) %></th>
STRING

# Table content
Deface::Override.new :virtual_path => 'projects/settings/_issue_categories',
                     :name         => 'add-tracker-column',
                     :insert_before => 'td.buttons',
                     :text         => <<STRING
<td><%=h(category.tracker.name) if category.tracker %></td>
STRING
