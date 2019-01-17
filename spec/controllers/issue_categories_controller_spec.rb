require "spec_helper"
require File.dirname(__FILE__) + '/../../lib/per_tracker_categories/issue_category_patch'

describe IssueCategoriesController, :type => :controller do

  fixtures :issue_categories, :trackers

  before do
    @request.session[:user_id] = 1
  end

  it "should update category with tracker" do
    put :update, params: {:id => 4, :issue_category => {:name => 'Printing', :tracker_ids => [1, 3]}}
    expect(response).to redirect_to(settings_project_path(id: 'onlinestore', tab: :categories))
    expect(IssueCategory.find(4).trackers).to eq [Tracker.find(1), Tracker.find(3)]
  end

end
