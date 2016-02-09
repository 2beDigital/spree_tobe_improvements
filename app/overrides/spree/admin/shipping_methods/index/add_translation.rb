Deface::Override.new(
    :virtual_path => 'spree/admin/shipping_methods/index',
    :name => 'add_index_shipping_methods_translations_link',
    :insert_bottom => "td.actions",
    :partial => 'spree/admin/shipping_methods/add_translation_link'
)
