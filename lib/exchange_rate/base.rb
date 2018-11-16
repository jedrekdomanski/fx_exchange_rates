require 'yaml'

class Base
  attr_reader :rates, :dates, :currencies

  def initialize
    @rates = load_data
    @dates = rates.keys
    @currencies = rates[dates.first].keys
  end

  def rates_at(date, currency)
    raise KeyError, 'Date not available' unless dates.include?(date)
    raise KeyError, "#{currency} currency not found" unless currencies.include?(currency)
    rates[date][currency]
  end

  private

  def load_data
    rates_file = "#{File.join(File.dirname(__FILE__))}/rates.yaml"
    ExchangeRate.fetch_data_and_save_to_disk unless File.exists?(rates_file)
    YAML.load_file(rates_file)
  end
end
