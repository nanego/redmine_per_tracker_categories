require "spec_helper"
require "active_support/testing/assertions"

describe ProjectsController, :type => :controller do
  include ActiveSupport::Testing::Assertions

  fixtures :projects, :versions, :users, :email_addresses, :roles, :members,
           :member_roles, :issues, :journals, :journal_details,
           :trackers, :projects_trackers, :issue_statuses,
           :enabled_modules, :enumerations, :boards, :messages,
           :attachments, :custom_fields, :custom_values, :time_entries,
           :wikis, :wiki_pages, :wiki_contents, :wiki_content_versions, :issue_categories

  before :each do
    @request.session[:user_id] = 1 # admin
    Setting.default_language = 'en'
  end

  it "copy project and requested items" do

    IssueCategory.where(project: 1).each do |cat|
      cat.tracker_ids = [1, 3]
    end

    assert_difference 'Project.count' do
      post :copy, :params => {
          :id => 1,
          :project => {
              :name => 'Copy',
              :identifier => 'unique-copy',
              :tracker_ids => ['1', '2', '3', ''],
              :enabled_module_names => %w(issue_tracking time_tracking)

          },
          :only => %w(issue_categories)
      }
    end
    project = Project.find('unique-copy')
    source = Project.find(1)
    assert_equal %w(issue_tracking time_tracking), project.enabled_module_names.sort

    assert_equal source.issue_categories.count, project.issue_categories.count, "All issues were not copied"
    assert_equal 0, project.members.count

    # It should also copy project-categories and associated trackers
    expect(project.issue_categories.first.trackers).to eq [Tracker.find(1), Tracker.find(3)]
  end

end


