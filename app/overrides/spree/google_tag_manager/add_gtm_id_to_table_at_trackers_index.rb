Deface::Override.new(:virtual_path => 'spree/admin/trackers/index',
                     :name => 'remove_table',
                     :sequence => 1,
                     :remove => 'erb[silent]:contains("@trackers.each do |tracker|")',
                     :closing_selector => 'erb[silent]:contains("end")')

Deface::Override.new(:virtual_path => 'spree/admin/trackers/index',
                     :name => 'replace_table',
                     :sequence => 2,
                     :replace => 'erb[loud]:contains("Spree.t(:google_analytics_id)")',
                     :text => '<%= Spree.t(:analytics_trackers) %>')

Deface::Override.new(:virtual_path => 'spree/admin/trackers/index',
                     :name => 'add_gtm_id_to_table',
                     :sequence => 3,
                     :insert_top => 'tbody',
                     :partial => 'spree/admin/trackers/new_table' )