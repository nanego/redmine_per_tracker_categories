module PerTrackerCategories
  class Hooks < Redmine::Hook::ViewListener

    class ModelHook < Redmine::Hook::Listener
      def after_plugins_loaded(_context = {})
        require_relative 'issue_category_patch'
        require_relative 'tracker_patch'
        require_relative 'project_patch'
        require_relative 'issue_categories_controller_concern'
      end
    end

  end
end
