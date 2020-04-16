require "spec_helper"

describe IssuesController, :type => :controller do

  fixtures :issue_categories, :issues, :trackers, :users, :members, :projects, :roles, :member_roles, :enabled_modules

  render_views

  before :each do
    @request.session[:user_id] = 1
  end

  it "should display category field if some categories are defined" do
    get :edit, :params => {:id => 1}
    expect(response).to be_successful
    assert_select 'select#issue_category_id', 1
  end

  it "should NOT display category field if no categories are defined" do
    puts Project.find(1).issue_categories.inspect
    Project.find(1).issue_categories.delete_all
    get :edit, :params => {:id => 1}
    expect(response).to be_successful
    assert_select 'select#issue_category_id', 0
  end

  it "should display category field if some categories are defined with selected tracker" do
    Project.find(1).issue_categories.each { |cat| cat.trackers = [Tracker.find(1)]; cat.save! }
    expect(Issue.find(1).tracker_id).to eq 1
    get :edit, :params => {:id => 1}
    expect(response).to be_successful
    assert_select 'select#issue_category_id', 1
  end

  it "should NOT display category field if no categories are defined with selected tracker" do
    Project.find(1).issue_categories.each { |cat| cat.trackers = [Tracker.find(1)]; cat.save! }
    Issue.find(1).update_attribute('tracker_id', 2)
    get :edit, :params => {:id => 1}
    expect(response).to be_successful
    assert_select 'select#issue_category_id', 0
  end
end
