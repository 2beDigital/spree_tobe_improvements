Deface::Override.new(:virtual_path => 'spree/admin/trackers/index',
                     :name => 'remove_table',
                     :sequence => 1,
                     :remove => 'erb[silent]:contains("@trackers.each do |tracker|")',
                     :closing_selector => 'erb[silent]:contains("end")')

Deface::Override.new(:virtual_path => 'spree/admin/trackers/index',
                     :name => 'add_gtm_id_to_table',
                     :sequence => 2,
                     :insert_top => 'tbody',
                     :partial => 'spree/admin/trackers/new_table' )