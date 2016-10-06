class AddExtendMasterPriceToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :extend_master_price, :boolean, default: true
  end
end
