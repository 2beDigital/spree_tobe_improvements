Spree::OrderContents.class_eval do
    private
      def after_add_or_remove(line_item, options = {})
        persist_totals
        shipment = options[:shipment]
        shipment.present? ? shipment.update_amounts : order.ensure_updated_shipments
        changes_from_admin = changes_order_from_admin?
        Spree::PromotionHandler::Cart.new(order, line_item).activate
        Spree::ItemAdjustments.new(line_item).update
        restore_order_state if changes_from_admin
        persist_totals
        line_item
      end

      def changes_order_from_admin?
        if order.completed? && order.state = 'complete'
          order.state = 'cart'
          order.completed_at = nil
          return true
        end
        return false
      end

      def restore_order_state
          order.state = 'complete'
          order.completed_at = Time.now()
      end
end
