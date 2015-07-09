Deface::Override.new :virtual_path => 'issue_categories/_form',
                     :name         => 'add-tracker-select-box',
                     :insert_after => 'p:contains(":assigned_to_id")',
                     :text         => <<STRING
<p><%= f.select :tracker_id, @project.trackers.collect {|t| [t.name, t.id]}, :include_blank => true %></p>
STRING
