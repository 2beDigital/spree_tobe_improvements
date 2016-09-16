Deface::Override.new(virtual_path: 'spree/checkout/_payment',
					name: 'accept_conditions_1',
					remove: 'erb[loud]:contains("submit_tag Spree.t(:save_and_continue)")')

Deface::Override.new(virtual_path: 'spree/checkout/_payment',
					name: 'accept_conditions_2',
					remove: 'script')

Deface::Override.new(virtual_path: 'spree/checkout/_payment',
					name: 'accept_conditions_3',
					insert_top: 'div.form-buttons',
					text: "<%= render :partial => 'spree/shared/accept_terms_and_conditions', :locals => { :order => @order } %>")