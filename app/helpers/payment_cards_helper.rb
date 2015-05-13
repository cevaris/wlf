module PaymentCardsHelper

  def stripe_command
    begin
      yield
    rescue Stripe::CardError => e
      logger.error(e)
    rescue => e
      logger.error(e)
    end
  end

  def token_create(data)
    stripe_command {
      stripe_object = Stripe::Token.create(
        :card => data
      )

      payment_card = PaymentCard.new(
        name: stripe_object['card']['last4'],
        last4: stripe_object['card']['last4'],
        brand: stripe_object['card']['brand'],
        stripe_token: stripe_object['id'],
        card_token: stripe_object['card']['id']
      )
      return payment_card
    }
  end

end
