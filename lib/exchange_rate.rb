require "exchange_rate/version"
require "exchange_rate/data_loader"
require "exchange_rate/base"

module ExchangeRate
  def at(date, base, other)
    ex_rates = Base.new
    base_rate = ex_rates.rates_at(date.to_s, base)
    other_rate = ex_rates.rates_at(date.to_s, other)
    other_rate / base_rate
  end

  def fetch_data_and_save_to_disk
    DataLoader.save_to_disk
  end

  module_function :at, :fetch_data_and_save_to_disk
end