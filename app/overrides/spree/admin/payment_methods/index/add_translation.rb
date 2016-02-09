Deface::Override.new(
    :virtual_path => 'spree/admin/payment_methods/index',
    :name => 'add_index_payment_methods_translations_link',
    :insert_bottom => "td.actions",
    :partial => 'spree/admin/payment_methods/add_translation_link'
)
