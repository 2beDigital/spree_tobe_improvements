Deface::Override.new(:virtual_path => 'spree/admin/trackers/_form',
                     :name => 'add_fields_fot_gtm_on_admin',
                     :insert_bottom => 'div[data-hook="admin_tracker_form_fields"]',
                     :partial => 'spree/admin/trackers/google_tag_manager_for_admin')