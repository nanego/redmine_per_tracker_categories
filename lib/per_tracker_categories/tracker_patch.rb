module PerTrackerCategories::TrackerPatch

    def self.included(base)
      base.class_eval do
        has_and_belongs_to_many :issue_categories
      end
    end

end

Tracker.include(PerTrackerCategories::TrackerPatch)
