class Magnify::Category

  def initialize _token
    @token = _token
    @base_url = 'http://themommychannel.magnify.net/api'
  end
  
  # get all of magnify's playlists
  def all
    url = "#{@base_url}/list/browse?key=#{@token}&format=json"
    resp = Net::HTTP.get_response(URI.parse(url))
    data = JSON.parse(resp.body)
    unless data.kind_of?(Array)
      data = [data]
    end
    data.collect{|d| d['entry'][0]}
  end

  # return the videos within a playlist
  def find _id
    url = "#{@base_url}/list/browse?id=#{_id}&key=#{@token}&format=json"
    resp = Net::HTTP.get_response(URI.parse(url))
    info = JSON.parse(resp.body)
    url = "#{@base_url}/list/show?id=#{_id}&key=#{@token}&format=json"
    resp = Net::HTTP.get_response(URI.parse(url))
    videos = JSON.parse(resp.body)
    videos.each{|v| ap v}
    {info: info['entry'][0], videos: videos['entry']}
  end

end