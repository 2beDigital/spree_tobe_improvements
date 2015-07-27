module Spree
  module Admin
    class StoresController < Spree::Admin::ResourceController
      protected
        def location_after_save
          #Tradueix a edit_admin_general_settings_url
          spree.polymorphic_url([:edit, :admin, :general_settings])
        end
    end
  end
 end