Deface::Override.new(:virtual_path => 'spree/orders/edit',
                     :name => 'remove_coupon',
                     :remove => 'erb[loud]:contains(":coupon_code")',
                     :original => '<%= order_form.text_field :coupon_code, :size => 10, :placeholder => Spree.t(:coupon_code) %>')

Deface::Override.new(:virtual_path => 'spree/checkout/_payment',
                     :name => 'remove_coupon_payment',
                     :remove => 'p[data-hook="coupon_code"]')