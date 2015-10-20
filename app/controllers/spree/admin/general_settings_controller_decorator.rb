Spree::Admin::GeneralSettingsController.class_eval do
  alias_method :edit_original, :edit unless method_defined? :edit_original
  def edit
    edit_original
    @preferences_currency << :minimum_order_value
    @preferences_currency << :backorder_charge
  end
end