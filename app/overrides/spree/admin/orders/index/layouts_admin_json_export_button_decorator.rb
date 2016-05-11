Deface::Override.new(:virtual_path => "spree/admin/shared/_content_header",
                     :name => "json_export_button",
                     :insert_top => "[data-hook='toolbar']>ul",
                     :partial => "spree/admin/orders/add_json_order_export_button",
                     :disabled => false)
