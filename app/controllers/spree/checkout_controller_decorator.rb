Spree::CheckoutController.class_eval do
  after_action :check_backorder_shipment
  def ensure_checkout_allowed
    check = @order.checkout_allowed?
    unless check == true
      redirect_to spree.cart_path, :flash => {:notice => I18n.t("checkout_allowed_errors.#{check}") + Spree::Config[:minimum_order_value] + " " + Spree::Config[:currency]}
    end
  end

  private
  def check_backorder_shipment
    if Spree::Config[:backorder_charge]
      @order.shipments.each do |shipment|
        if shipment.backordered?
          shipment.update_column(:cost, 0)
        end
      end
      @total =  Spree::Money.new(@order.shipments.to_a.sum(&:cost), currency: @order.currency)
      @order.update!
    end
  end
end