class InstagramService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.instagram.com/v1/")
  end

  def user_info(token)
    parse_json(connection.get("users/self/?access_token=#{token}"))
  end

  def search_by_tag(tag, token)
    parse_json(connection.get("tags/#{tag}/media/recent?access_token=#{token}"))
  end

  private

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
