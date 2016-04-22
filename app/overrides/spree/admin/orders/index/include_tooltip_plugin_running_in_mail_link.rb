Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "include_tooltip_plugin_init_js",
                     :insert_bottom => "[data-hook='admin_footer_scripts']",
                     :text => "<script>$('.tooltips').powerTip();</script>")