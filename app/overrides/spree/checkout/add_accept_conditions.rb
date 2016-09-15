Deface::Override.new(virtual_path: 'spree/checkout/_payment',
					name: 'accept_conditions',
					insert_before: 'div.form-buttons',
					text: "<% if Spree::Config[:require_terms_and_conditions] %>
							  <p class='field' style='clear: both'>
							    <%= form.check_box :terms_and_conditions %>
							    <%= form.label :terms_and_conditions, Spree.t(:accept_terms_and_conditions) %>
							   </p>
							<% end %>")