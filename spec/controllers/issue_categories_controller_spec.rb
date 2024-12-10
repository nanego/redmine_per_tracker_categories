require "spec_helper"

describe IssueCategoriesController, :type => :controller do

  fixtures :issue_categories, :trackers, :users, :members, :projects, :roles, :member_roles, :enabled_modules

  before :each do
    @request.session[:user_id] = 1
  end

  it "should update category with tracker" do
    put :update, params: { :id => 4, :issue_category => { :name => 'Printing', :tracker_ids => [1, 3] } }
    expect(response).to redirect_to(settings_project_path(id: 'onlinestore', tab: :categories))
    expect(IssueCategory.find(4).trackers).to eq [Tracker.find(1), Tracker.find(3)]
  end

  it "allows to reorder categories" do
    expect(IssueCategory.find(4).position).to eq 1

    put :update, params: { "id" => "4", "issue_category" => { "position" => "2" } }

    expect(response).to redirect_to(settings_project_path(id: 'onlinestore', tab: :categories))
    expect(IssueCategory.find(4).position).to eq 2
  end

end
