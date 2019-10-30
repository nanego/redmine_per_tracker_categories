require 'redmine'

# Patches to existing classes/modules
ActiveSupport::Reloader.to_prepare do
  require_dependency 'per_tracker_categories/issue_category_patch'
end

Redmine::Plugin.register :redmine_per_tracker_categories do
  name 'Redmine Per Tracker Issue Categories plugin'
  author 'Vincent ROBERT'
  description 'This plugin lets you link categories and trackers. It makes them available only when the specific tracker is selected.'
  version '4.0.0'
  url 'https://github.com/nanego/redmine_per_tracker_categories'
  author_url 'mailto:contact@vincent-robert.com'
  requires_redmine_plugin :redmine_base_deface, :version_or_higher => '0.0.1'
end
