class BarsGenerator
  attr_reader :data, :final_results

  class << self
    def get_place_ids_around(lat, lon)
      el = new(lat, lon)
      el.search_place_ids
      el.get_place_ids_from_results
      el.build_data!
      el.store_data
    end
  end

  def initialize(lat,lon)
    @lat = lat
    @lon = lon
    @data = []
    @final_results = []
  end

  def search_place_ids(next_page_token: nil)
    if next_page_token
      url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?pagetoken=#{next_page_token}&key=#{ENV['GOOGLE_API_KEY']}")
    else
      url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=bar&type=bar&location=#{@lat},#{@lon}&rankby=distance&key=#{ENV['GOOGLE_API_KEY']}")
    end

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    request_data = JSON.parse(response.read_body)

    next_page_token = request_data["next_page_token"]

    if next_page_token
      sleep 3
      search_place_ids(next_page_token: next_page_token)
    end

    @data << request_data
    # si dans data ya next_page_token, on fetch à nouveau mais sur cette url https://maps.googleapis.com/maps/api/place/nearbysearch/json?pagetoken=CpQCAgEAAFxg8o-eU7_uKn7Yqjana-HQIx1hr5BrT4zBaEko29ANsXtp9mrqN0yrKWhf-y2PUpHRLQb1GT-mtxNcXou8TwkXhi1Jbk-ReY7oulyuvKSQrw1lgJElggGlo0d6indiH1U-tDwquw4tU_UXoQ_sj8OBo8XBUuWjuuFShqmLMP-0W59Vr6CaXdLrF8M3wFR4dUUhSf5UC4QCLaOMVP92lyh0OdtF_m_9Dt7lz-Wniod9zDrHeDsz_by570K3jL1VuDKTl_U1cJ0mzz_zDHGfOUf7VU1kVIs1WnM9SGvnm8YZURLTtMLMWx8-doGUE56Af_VfKjGDYW361OOIj9GmkyCFtaoCmTMIr5kgyeUSnB-IEhDlzujVrV6O9Mt7N4DagR6RGhT3g1viYLS4kO5YindU6dm3GIof1Q&key=YOUR_API_KEY
    # générer un array de tous les place_ids de ces resultats
    # p @data
  end

  def get_place_ids_from_results
    @data = @data.map { |page_results| page_results["results"] }.flatten.map { |bar_json| bar_json["place_id"] }
  end

  def build_data!
    @data.each do |place_id|
      url = URI "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{place_id}&key=#{ENV['GOOGLE_API_KEY']}"

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Get.new(url)

      response = https.request(request)
      request_data = JSON.parse(response.read_body)
      p "information for #{place_id} fetched"
      @final_results << request_data
    end
    p @final_results
  end

  def store_data
    filepath = File.join(Rails.root,"/public/bars.json")

    File.open(filepath, "wb") do |file|
      file.write(JSON.generate(@final_results))
    end
  end
end
