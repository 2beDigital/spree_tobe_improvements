Deface::Override.new(
  :virtual_path => 'spree/admin/general_settings/edit',
  :name => 'add_translations_gs',
  :insert_after => "erb[silent]:contains('content_for :page_title')",
  :partial => 'spree/admin/general_settings/edit/add_translations'
)
