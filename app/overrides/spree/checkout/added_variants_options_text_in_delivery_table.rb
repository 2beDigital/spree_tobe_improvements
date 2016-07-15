Deface::Override.new(virtual_path: 'spree/checkout/_delivery',
					 name: 'added_variants_option_text',
					 replace: "erb[loud]:contains('item.variant.name')",
					 original: "<%= item.variant.name %>",
					 text: "<%= item.variant.name + ' ' + item.variant.options_text %>")