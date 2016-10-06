Deface::Override.new(virtual_path: 'spree/admin/products/_form',
					 name: 'extend_master_price_to_variants',
					 insert_before: 'div[data-hook="admin_product_form_promotionable"]',
					 text: '<div data-hook="admin_product_form_extend_master_price">
							    <%= f.field_container :extend_master_price do %>
								        <%= f.label :extend_master_price do %>
								          <%= f.check_box :extend_master_price %> <%= Spree.t(:extend_master_price) %>
								        <% end %>
								<% end %>
						    </div>',
					 disabled: false)