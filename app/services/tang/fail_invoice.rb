module Tang
  class FailInvoice
    def self.call(stripe_invoice)
      invoice = Invoice.find_by(stripe_id: stripe_invoice.id)

      # create charge
      charge = nil
      if stripe_invoice.charge.present?
        stripe_charge = Stripe::Charge.retrieve(stripe_invoice.charge)
        charge = Charge.from_stripe(stripe_charge, invoice)
      end

      # update subscription
      subscription = Subscription.find_by(stripe_id: stripe_invoice.subscription)
      subscription.fail! if !subscription.past_due?

      return charge
    end
  end
end