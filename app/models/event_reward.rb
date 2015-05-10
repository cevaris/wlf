class EventReward < ActiveRecord::Base
  belongs_to :event

  monetize :price_cents

  # def price=(price_value)
  #   binding.pry
  #   raise ArgumentError unless price_value.respond_to? :to_money
  #   money = price_value.to_money
  #   @price_cents = money.cents
  #   @price_currency = money.currency_as_string
  #   money
  # end

  # def price
  #   Money.new price_cents, price_currency
  # end
end
