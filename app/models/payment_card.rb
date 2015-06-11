class PaymentCard < ActiveRecord::Base

  MONTHS = [
    ["01 - January", 1],
    ["02 - February", 2],
    ["03 - March", 3],
    ["04 - April", 4],
    ["05 - May", 5],
    ["06 - June", 6],
    ["07 - July", 7],
    ["08 - August", 8],
    ["09 - September", 9],
    ["10 - October", 10],
    ["11 - November", 11],
    ["12 - December", 12]
  ]

  belongs_to :account

  attr_accessor :number
  attr_accessor :cvc
  attr_accessor :exp_month
  attr_accessor :exp_year

end
