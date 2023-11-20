class ParksService
  def get_parks_by_state(state)
    get_url("parks?q=#{state}&api_key=#{ENV['NPS_API_KEY']}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "curl -X GET "https://developer.nps.gov/api/v1/")
  end
end