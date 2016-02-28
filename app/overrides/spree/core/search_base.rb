Spree::Core::Search::Base.class_eval do

  alias_method :orig_get_base_scope,  :get_base_scope unless method_defined? :orig_get_base_scope
  alias_method :orig_prepare,  :prepare unless method_defined? :orig_prepare

  def get_base_scope
    if @properties[:order].blank?
      base_scope = orig_get_base_scope
    else
      base_scope = new_base_scope
    end
    return base_scope if (current_user and current_user.has_spree_role? :admin)
    if ActiveRecord::Base.connection.column_exists?(Spree::Product.table_name, :retail_only)
      if current_user and current_user.has_spree_role? :retail
        base_scope = base_scope.where("#{Spree::Product.quoted_table_name}.retail_only = ?", true).references("#{Spree::Product.quoted_table_name}")
      else
        base_scope = base_scope.where("#{Spree::Product.quoted_table_name}.retail_only != ?", true).references("#{Spree::Product.quoted_table_name}")
      end
    end
    base_scope
  end

  def prepare(params)
    orig_prepare(params)
    @properties[:order] = params[:order]
  end

  def new_base_scope
    base_scope = Spree::Product.active
    base_scope = base_scope.in_taxon_no_order(taxon) unless taxon.blank?
    base_scope = get_products_conditions_for(base_scope, keywords)
    base_scope = add_search_scopes(base_scope)
    base_scope = add_eagerload_scopes(base_scope)
    base_scope
  end

end