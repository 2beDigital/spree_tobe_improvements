module Spree
  PaymentMethod.class_eval do
    translates :name, :description,
               :fallbacks_for_empty_translations => true
    # Classpath bug; undefined method `whitelisted_ransackable_associations'
    include Spree::RansackableAttributes
    include SpreeI18n::Translatable
  end
end
