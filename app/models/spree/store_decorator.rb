module Spree
  Store.class_eval do
    translates :name,:seo_title,:meta_keywords,:meta_description,:fallbacks_for_empty_translations => true
    include SpreeI18n::Translatable
  end
end