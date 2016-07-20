Spree::AppConfiguration.class_eval do
  preference :minimum_order_value, :float,   :default => 0
  preference :backorder_charge,    :boolean, :default => false
  preference :check_categories,    :boolean, :default => false
  preference :show_sku,            :boolean, :default => true
  preference :show_taxes,          :boolean, :default => true
end