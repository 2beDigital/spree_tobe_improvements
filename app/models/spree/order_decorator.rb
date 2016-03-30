Spree::Order.class_eval do
  def checkout_allowed?
    return :not_empty     unless line_items.count > 0
    return :minimum_order_value unless total >= Spree::Config[:minimum_order_value].to_f
    true
  end

	# override this to also set current user locale for email i18n
	def deliver_order_confirmation_email
		update_attribute(:locale, I18n.locale)
		begin
			OrderMailer.confirm_email(self.id).deliver
		rescue Exception => e
			logger.error("#{e.class.name}: #{e.message}")
			logger.error(e.backtrace * "\n")
		end
	end
	
  private

  def after_cancel
    shipments.each { |shipment| shipment.cancel! }
    #payments.completed.each { |payment| payment.cancel! }
    send_cancel_email
    self.update!
  end

end