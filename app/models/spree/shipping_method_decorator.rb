module Spree
  ShippingMethod.class_eval do
    translates :name,
               :fallbacks_for_empty_translations => true
    # Classpath bug; undefined method `whitelisted_ransackable_associations'
    include Spree::RansackableAttributes
    include SpreeI18n::Translatable
  end
end
