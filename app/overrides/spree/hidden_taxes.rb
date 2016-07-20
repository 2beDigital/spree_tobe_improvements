Deface::Override.new(:virtual_path => 'spree/orders/_adjustments',
                     :name => 'hidden_taxes_in_cart',
                     :replace => 'erb[silent]:contains("@order.all_adjustments.tax.eligible.group_by(&:label).each")',
                     :closing_selector => "erb[silent]:contains('end')",
                     :text => '<% if show_taxes %>
                                   <% @order.all_adjustments.tax.eligible.group_by(&:label).each do |label, adjustments| %>
                                       <%= render "spree/orders/adjustment_row", :label => label, :adjustments => adjustments, :type => Spree.t(:tax) %>
                                   <% end %>
                               <% end %>')

Deface::Override.new(:virtual_path => 'spree/checkout/_summary',
                     :name => 'hidden_taxes_in_summary',
                     :replace => 'erb[silent]:contains("order.all_adjustments.nonzero.tax.eligible.group_by(&:label).each")',
                     :closing_selector => "erb[silent]:contains('end')",
                     :text => '<% if show_taxes %>
                                   <% order.all_adjustments.nonzero.tax.eligible.group_by(&:label).each do |label, adjustments| %>
                                          <tr class="total">
                                                 <td><%= label %></td>
                                                 <td><%= Spree::Money.new(adjustments.sum(&:amount), currency: order.currency).to_html %></td>
                                          </tr>
                                   <% end %>
                               <% end %>')

Deface::Override.new(:virtual_path => 'spree/shared/_order_details',
                     :name => 'hidden_taxes_in_order_details',
                     :replace => 'erb[silent]:contains(" if order.all_adjustments.tax.exists?")',
                     :text => '<% if order.all_adjustments.tax.exists? && show_taxes %>')

Deface::Override.new(:virtual_path => 'spree/order_mailer/confirm_email',
                     :name => 'hidden_taxes_in_order_mailer_confirm',
                     :replace => 'erb[silent]:contains(" if @order.all_adjustments.eligible.tax.exists?")',
                     :text => '<% if @order.all_adjustments.eligible.tax.exists? && show_taxes %>')