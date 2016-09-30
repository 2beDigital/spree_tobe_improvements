Spree::Admin::ProductsController.class_eval do
	alias_method :orig_update, :update unless method_defined? :orig_update
	def update
		orig_update
		if params[:extend_master_price].present?
		  	modify_variant_price_with_master_price
		end
	end

	private

	def modify_variant_price_with_master_price
		if @product.has_variants?
			@product.variants.each do |variant|
				variant.price = @product.price.to_f
				variant.cost_price = @product.cost_price.to_f
				variant.save
			end
		end
	end
end



