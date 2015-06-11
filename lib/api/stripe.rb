class Api::Stripe

  def self.token_create(card_data)
    stripe_object = Stripe::Token.create(card: card_data)
    Rails.logger.info stripe_object.inspect
    stripe_object
  end

  def self.customer_create(email, token)
    stripe_command {
      Stripe::Customer.create(
        card: token,
        email: email
      )
    }
  end

  # money+:: +Money+ object
  def self.charge_create(email, token, money)
    stripe_command {
      customer = customer_create(email, token)
      Rails.logger.info "Created customer #{customer.inspect}"

      charge = Stripe::Charge.create(
        amount: money.fractional,
        currency: money.currency.iso_code,
        customer: customer.id
      )
    }
  end


  def self.from_stripe_token(stripe_token)
    PaymentCard.new(
      name: stripe_token['card']['last4'],
      last4: stripe_token['card']['last4'],
      brand: stripe_token['card']['brand'],
      stripe_token: stripe_token['id'],
      card_token: stripe_token['card']['id']
    )
  end
end
