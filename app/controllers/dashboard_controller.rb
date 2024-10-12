class DashboardController < ApplicationController
  before_action :authenticate_user!  # Ensure only logged-in users can access the dashboard

  def index
    # Any logic for your dashboard can go here
  end
end
