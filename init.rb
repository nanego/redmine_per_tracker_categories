require 'redmine'

# Patches to existing classes/modules
ActionDispatch::Callbacks.to_prepare do
  require_dependency 'per_tracker_categories/issue_category_patch'
end

Redmine::Plugin.register :redmine_per_tracker_categories do
  name 'Redmine Per Tracker Issue Categories plugin'
  author 'Vincent ROBERT'
  description 'This is a plugin for Redmine'
  version '1.0.0'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end
