Deface::Override.new(virtual_path: 'spree/admin/general_settings/edit',
					 name: 'add_preferences_orders_and_shipments',
					 insert_top: "div#preferences div.row div.alpha.six.columns",
				     text: '<fieldset class="currency no-border-bottom">
						    	<legend align="center"><%= Spree.t(:orders_and_shipments_settings)%></legend>
						    	<% @preferences_order_and_shipments.each do |key|
						        	type = Spree::Config.preference_type(key) %>
						        	<div class="field">
						          	<%= label_tag(key, Spree.t(key)) + tag(:br) if type != :boolean %>
						          	<%= preference_field_tag(key, Spree::Config[key], :type => type) %>
						          	<%= label_tag(key, Spree.t(key)) + tag(:br) if type == :boolean %>
						        	</div>
						    	<% end %>
						  	</fieldset>')