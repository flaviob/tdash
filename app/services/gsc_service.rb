class GscService
  def initialize(google_token)
    @google_token = google_token
  end

  def query_search_analytics(site_url, start_date, end_date)
    # Make sure the token is refreshed
    current_user.refresh_google_token! if current_user.google_token_expired?

    # Use the token for the API request
    response = RestClient.get("https://www.googleapis.com/webmasters/v3/sites/#{site_url}/searchAnalytics/query", {
      Authorization: "Bearer #{current_user.google_token}"
    })

    JSON.parse(response.body)
  end
end
