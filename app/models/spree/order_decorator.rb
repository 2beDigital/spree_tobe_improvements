Spree::Order.class_eval do

  alias_method :orig_deliver_order_confirmation_email,  :deliver_order_confirmation_email unless method_defined? :orig_deliver_order_confirmation_email
  attr_accessor :temporary_address, :temporary_credit_card, :terms_and_conditions

  def checkout_allowed?
    return :not_empty     unless line_items.count > 0
    return :minimum_order_value unless total >= Spree::Config[:minimum_order_value].to_f
    true
  end

	# override this to also set current user locale for email i18n
	def deliver_order_confirmation_email
		update_attribute(:locale, I18n.locale) if self.has_attribute?(:locale)
    orig_deliver_order_confirmation_email
	end

  def ensure_terms_and_conditions
    unless terms_and_conditions_accepted?
      errors.add(:terms_and_conditions, Spree.t(:must_accept_terms_and_conditions))
    end

    errors.empty?
  end

  def terms_and_conditions_accepted?
    terms_and_conditions.in?([true, 'true', '1'])
  end
	
  private

  def after_cancel
    shipments.each { |shipment| shipment.cancel! }
    #payments.completed.each { |payment| payment.cancel! }
    send_cancel_email
    self.update!
  end

end
