module Spree::Admin
  TranslationsController.class_eval do
    alias_method :orig_collection_url, :collection_url unless method_defined? :orig_collection_url

    private
      def collection_url
        if resource_name=="store"
          send "edit_admin_general_settings_url"
        else
          orig_collection_url
        end
      end

  end
end
