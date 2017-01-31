module Spree::Admin
  UsersController.class_eval do
	  #sort by created_at desc by default.
		before_action :sort, only: :index
    alias_method :index_original, :index unless method_defined? :index_original
    respond_to :csv, :only => [:index]
    def index
      respond_with(@collection) do |format|
        format.csv { @collection = @search.result and return }
        format.any { index_original and return }
      end
    end
		
		def sort
			logger.debug "SOOORT"
			logger.debug request.format
			if (!params.has_key?(:q) and !request.format.csv?)
				redirect_to(admin_users_url('q[s]'=>'created_at desc')) and return
			end		
		end
		
  end
 end