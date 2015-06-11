module PaymentCardsHelper
  # stripe_data+:: +Hash+ containing payment_card attributes
  def create_stripe_hash(stripe_data)
    {
      number: stripe_data['number'],
      cvc: stripe_data['cvc'],
      exp_month: stripe_data['exp_month'],
      exp_year: stripe_data['exp_year']
    }
  end
end
