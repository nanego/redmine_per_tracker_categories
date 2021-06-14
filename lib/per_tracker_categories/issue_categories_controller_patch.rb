require_dependency 'issue_categories_controller'

class IssueCategoriesController < ApplicationController

  def update
    @category.safe_attributes = params[:issue_category]
    if @category.save
      respond_to do |format|
        format.html do
          flash[:notice] = l(:notice_successful_update)
          redirect_to_settings_in_projects
        end
        format.api {render_api_ok}
        format.js { head 200 } ## PATCHED
      end
    else
      respond_to do |format|
        format.html {render :action => 'edit'}
        format.api {render_validation_errors(@category)}
        format.js { head 422 } ## PATCHED
      end
    end
  end

end
