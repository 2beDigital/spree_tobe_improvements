Deface::Override.new(:virtual_path => 'spree/layouts/spree_application',
                     :name => 'add_script_for_cookies',
                     :insert_bottom => 'body',
                     :text => '<%= yield :script %>')