Spree::Admin::GeneralSettingsController.class_eval do
  alias_method :edit_original, :edit unless method_defined? :edit_original
  def edit
    edit_original
    @preferences_order_and_shipments = [:require_terms_and_conditions, :minimum_order_value, :backorder_charge, :check_categories, :show_sku, :show_taxes]
  end
end