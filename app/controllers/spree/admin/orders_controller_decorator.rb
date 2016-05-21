Spree::Admin::OrdersController.class_eval do
  def destroy
    order = Spree::Order.find(params[:id])
    if !order.complete?
      order.delete
      flash[:success] = I18n.t(:order_delete)
      respond_with(order) do |format|
        format.html { redirect_to :back }
        format.js   { render_js_for_destroy }
      end
    else
       flash[:notice] = I18n.t(:order_not_delete)   
       redirect_to :back      
    end
  end
end