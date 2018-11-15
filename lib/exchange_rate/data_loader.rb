require 'open-uri'
require 'nokogiri'

module DataLoader
  def save_to_disk
    url = 'https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'
    response = Nokogiri::XML(open(url))
    rate = parse_response(response)
  end

  private

  def parse_response(data)
    rates = {}
    data.css('Cube>Cube[time]').each do |day|
      time = day[:time]
      rates[time] = {}
      day.css('Cube').each do |currency|
        rates[time][currency[:currency]] = currency[:rate].to_f
      end
    end
    rates
  end

  module_function :save_to_disk, :parse_response
end