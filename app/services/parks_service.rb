# class ParksService
#   def self.get_parks_by_state(state)
#     get_url("/parks?q=#{state}&api_key=#{ENV['NPS_API_KEY']}")
#   end

#   def self.get_url(url)
#     response = conn.get(url)
#     JSON.parse(response.body, symbolize_names: true)
#   end

#   def self.conn
#     Faraday.new(url: "https://developer.nps.gov/api/v1")
#   end
# end

class ParksService
  def self.conn
    Faraday.new(url: "https://developer.nps.gov/api/v1/") do |faraday|
      faraday.headers["x-api-key"] = ENV["NPS_API_KEY"]
    end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_parks_by_state(state_code)
    get_url("parks?stateCode=#{state_code}")
  end
end