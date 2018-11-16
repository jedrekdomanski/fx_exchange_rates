require "exchange_rate/version"
require "exchange_rate/data_loader"
require "exchange_rate/base"
require "bigdecimal"

module ExchangeRate
  def at(date, base, other)
    date = date_string(date_rep)
    ex_rates = Base.new
    base_rate = ex_rates.rates_at(date, base)
    base = BigDecimal(base_rate.to_s)
    other = ex_rates.rates_at(date, other)
    other_rate = BigDecimal(other.to_s)
    other_rate / base
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

  def valid_dd_mm_yyyy(date_string)
    matches = date_string =~ /^(3[0-1]|0[1-9]|[1-2][0-9])(?:(1[0-2]|0[1-9])|/(1[0-2]|0[1-9])/)([0-9]{4})/
    raise ArgumentError, 'Not a valid date string (dd/mm/yyyy)' unless matches
    date_string
  end

  def date_string(date_rep)
    if date_rep.is_a? Date
      date_rep.to_s
    elsif date_rep.is_a? String
      valid_dd_mm_yyyy(date_rep)
    else
      raise ArgumentError, "'date' must be a Date or 'dd/mm/yyyy' string"
    end
  end

  module_function :at,
                  :fetch_data_and_save_to_disk,
                  :available_currencies,
                  :available_dates,
                  :most_recent,
                  :valid_dd_mm_yyyy,
                  :date_string
end


