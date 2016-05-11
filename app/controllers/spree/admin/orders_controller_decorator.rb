module Spree
  module Admin
    Spree::Admin::OrdersController.class_eval do

      require 'httparty'

      def json_from_api
        if try_spree_current_user && spree_current_user.spree_api_key.present?
          result = HTTParty.get(
              'https://' + Spree::Store.first.url+'/api/orders/'+load_order.number,
              #'/api/orders/'+load_order.number,
              verify: false,
              headers: { "X-Spree-Token" =>   spree_current_user.spree_api_key}
          ).parsed_response
          render :json => result
        else
          flash[:error] = Spree.t(:authorization_failure)
          redirect_to spree.admin_unauthorized_path
        end
      end

      # DEPRECATED METHODS TO ALLOW CHANGE ORDER STATES
      # def shipment_state_upgrade
      #   state = params[:state] || "shipped"
      #   @order.update(:shipment_state => state)
      #   @order.shipments.each do |shipment|
      #     shipment.update(:state => state)
      #   end
      #   redirect_to edit_admin_order_url
      # end
      #
      # def undo_approve_order
      #   @order.update_attributes(approver_id: nil, approved_at: nil)
      #   redirect_to edit_admin_order_url
      # end

    end
  end
end
