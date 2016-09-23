Spree::UsersController.class_eval do
	
	def update
	    if @user.update_attributes(spree_user_update_params)
			if params[:spree_user][:password].present?
				user = Spree::User.reset_password_by_token(params[:spree_user])
				sign_in(@user, :event => :authentication, :bypass => !Spree::Auth::Config[:signout_after_password_change])
			end
	      	redirect_to spree.account_url, :notice => Spree.t(:account_updated)
	    else
		    flash.now[:error] = "Se ha producido un error"
		    render :edit
	    end
	end

	private

	def spree_user_update_params
		  Spree::PermittedAttributes.user_attributes.push( bill_address_attributes: [:firstname, 
		  																			 :lastname, 
		  																			 :company, 
		  																			 :ident_fiscal, 
		  																			 :address1, 
		  																			 :address2, 
		  																			 :city, 
		  																			 :country_id, 
		  																			 :state_name, 
		  																			 :zipcode, 
		  																			 :phone])
		  params.require(:spree_user).permit(Spree::PermittedAttributes.user_attributes |
		                                     [bill_address_attributes: Spree::PermittedAttributes.address_attributes,
		                                      ship_address_attributes: Spree::PermittedAttributes.address_attributes])
	end
end