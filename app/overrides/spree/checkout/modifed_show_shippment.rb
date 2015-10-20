Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'remove_h5',
                     :sequence => 1,
                     :remove => 'h5.stock-shipping-method-title')

Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'remove_shipping_rates',
                     :sequence => 2,
                     :remove => 'erb[silent]:contains("ship_form.object.shipping_rates.each do |rate|")',
                     :closing_selector => 'erb[silent]:contains("end")')

Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'remove_ul',
                     :sequence => 3,
                     :remove => 'ul.field.radios.shipping-methods')

Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'insert_new_method_shipping',
                     :sequence => 4,
                     :insert_bottom => 'div.shipment',
                     :partial => 'spree/checkout/modified_shipping_method' )