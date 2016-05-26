Deface::Override.new(:virtual_path => "spree/admin/orders/index",
                     :name => "add_remove_orders",
                     :insert_bottom => "[data-hook='admin_orders_index_row_actions']",
                     :text =>  "<% css_class = (order.complete?) ? 'fa fa-trash icon_link with-tip no-text' : 'delete-resource fa fa-trash icon_link with-tip no-text' %>
                     		   	<% if !order.complete? %>
                               		<%= link_to '', admin_order_path(order.id), class: css_class, method: :delete, data: {confirm: Spree.t(:are_you_sure_you_want_to_delete_this_record)} %>
                               	<% end %> ")