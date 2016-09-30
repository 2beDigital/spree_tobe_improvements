Deface::Override.new(virtual_path: 'spree/admin/products/_form',
					 name: 'extend_master_price_to_variants',
					 insert_before: 'div[data-hook="admin_product_form_promotionable"]',
					 text: '<div data-hook="admin_product_form_extend_master_price">
						        <%= check_box_tag(:extend_master_price, value = "1", checked = false) %>
						        <%= Spree.t(:extend_master_price) %>
						    </div>',
					 disabled: false)