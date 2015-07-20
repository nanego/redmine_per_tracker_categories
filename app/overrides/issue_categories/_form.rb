Deface::Override.new :virtual_path => 'issue_categories/_form',
                     :name         => 'add-tracker-select-box',
                     :insert_after => 'p:contains(":assigned_to_id")',
                     :text         => <<STRING
<p><%= f.select :tracker_ids, @project.trackers.collect {|t| [t.name, t.id]}, {:include_blank => true}, {:multiple => true} %></p>
<script type="text/javascript">
  $(function() {
    if ((typeof $().select2) === 'function') {
      $('#issue_category_tracker_ids').select2({
        containerCss: {minWidth: '350px'}
      });
    }
  });
</script>
STRING
