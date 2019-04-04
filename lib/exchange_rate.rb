require "exchange_rate/version"
require "exchange_rate/data_loader"
require "exchange_rate/base"

module ExchangeRate
  def at(date, base, other)
    date = set_format_of(date)
    ex_rates = Base.new
    base_rate = ex_rates.rates_at(date, base)
    other_rate = ex_rates.rates_at(date, other)
    other_rate / base_rate
  end

  def available_currencies
    Base.new.currencies
  end

  def available_dates
    Base.new.dates
  end

  def most_recent
    data = Base.new
    latest_date = data.dates.first
    data.rates[latest_date]
  end

  def fetch_data_and_save_to_disk
    DataLoader.save_to_disk
  end

  def set_format_of(date)
    date.gsub!(/\W/, '-')
  end

  module_function :at,
                  :fetch_data_and_save_to_disk,
                  :available_currencies,
                  :available_dates,
                  :most_recent,
                  :set_format_of
end
