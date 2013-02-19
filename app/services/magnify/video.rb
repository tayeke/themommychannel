class Magnify::Video

  def initialize _token
    @token = _token
    @base_url = 'http://themommychannel.magnify.net/api'
  end
  
  # finds a single video
  def find _id
    url = "#{@base_url}/content/show?id=#{_id}&key=#{@token}&format=json"
    resp = Net::HTTP.get_response(URI.parse(url))
    data = JSON.parse(resp.body)
    data['entry'][0]
  end

end