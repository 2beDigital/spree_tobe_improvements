Spree::Admin::PaymentMethodsController.class_eval do    

    def update
      invoke_callbacks(:update, :before)
      payment_method_type = ''
      if params[:payment_method].present?
        payment_method_type = params[:payment_method].delete(:type)
      end
      if @payment_method['type'].to_s != payment_method_type
        @payment_method.update_columns(
          type: payment_method_type,
          updated_at: Time.now,
        )
        @payment_method = Spree::PaymentMethod.find(params[:id])
      end

      update_params = params[ActiveModel::Naming.param_key(@payment_method)] || {}
      attributes = ''
      unless update_params.blank?
        attributes = payment_method_params.merge(update_params)
        attributes.each do |k,v|
          if k.include?("password") && attributes[k].blank?
            attributes.delete(k)
          end
        end
      end

      unless attributes.blank?
        if @payment_method.update_attributes(attributes)
          invoke_callbacks(:update, :after)
          flash[:success] = Spree.t(:successfully_updated, :resource => Spree.t(:payment_method))
          redirect_to edit_admin_payment_method_path(@payment_method)
        else
          invoke_callbacks(:update, :fails)
          respond_with(@payment_method)
        end
      else
          invoke_callbacks(:update, :after)
          flash[:success] = Spree.t(:successfully_updated, :resource => Spree.t(:payment_method))
          redirect_to edit_admin_payment_method_path(@payment_method)
      end
    end
end