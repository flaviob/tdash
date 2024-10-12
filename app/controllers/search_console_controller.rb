class SearchConsoleController < ApplicationController
  def index
    # This will be the main page for connecting GSC
  end

  def search_analytics
    @gsc_service = GscService.new(current_user.google_token) # Assuming you have Google token saved in the user model
    @analytics_data = @gsc_service.query_search_analytics(params[:site_url], params[:start_date], params[:end_date])
  end
end
