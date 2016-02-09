module Spree::Admin
  UsersController.class_eval do
    alias_method :index_original, :index unless method_defined? :index_original
    respond_to :csv, :only => [:index]
    def index
      respond_with(@collection) do |format|
        format.csv { @collection = @search.result and return }
        format.any { index_original }
      end
    end
  end
 end