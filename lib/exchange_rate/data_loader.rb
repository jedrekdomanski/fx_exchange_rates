require 'open-uri'
require 'nokogiri'
require 'yaml'

module DataLoader
  def save_to_disk
    url = 'https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'
    response = Nokogiri::XML(open(url))
    rates = parse_response(response)
    if response
      rates_file = "#{File.join(File.dirname(__FILE__))}/rates.yaml"
      File.open(rates_file, 'w') do |file| 
        file.truncate(0)
        file << rates.to_yaml
      end
    end
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

