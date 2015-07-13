Deface::Override.new(
	:virtual_path => 'spree/shared/_header',
  :name => 'add_2bg_to_index',
  :insert_after => "#logo",
  :text => "<h1>2BeDigital Test</h1>"
)
