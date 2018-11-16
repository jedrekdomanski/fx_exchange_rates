require 'yaml'

class Base
  attr_reader :rates, :dates, :currencies

  def initialize
    @rates = load_data
    @dates = rates.keys
    @currencies = rates[dates.first].keys
  end

  def rates_at(date, currency)
    rates[date][currency]
  end

  private

  def load_data
    rates_file = "#{File.join(File.dirname(__FILE__))}/rates.yaml"
    YAML.load_file(rates_file)
  end
end

