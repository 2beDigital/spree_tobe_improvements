Spree::Admin::ShippingMethodsController.class_eval do

 	private

      def set_shipping_category
        if params["shipping_method"][:shipping_categories] == "" and @shipping_method.shipping_categories.blank?
        	return true
        elsif params["shipping_method"][:shipping_categories] != "" and @shipping_method.shipping_categories.blank?
	        @shipping_method.shipping_categories = Spree::ShippingCategory.where(:id => params["shipping_method"][:shipping_categories])
	    end
	    @shipping_method.save
	    params[:shipping_method].delete(:shipping_categories)
      end

      def set_zones
        if params["shipping_method"][:zones] == "" and @shipping_method.zones.blank?
        	return true
        elsif params["shipping_method"][:zones] != "" and @shipping_method.zones.blank?
	        @shipping_method.zones = Spree::Zone.where(:id => params["shipping_method"][:zones])
	    end
	    @shipping_method.save
	    params[:shipping_method].delete(:zones)
      end
end