class AddTranslationToStore < ActiveRecord::Migration
  def change
    params = { :name => :string, :seo_title => :string, :meta_description => :text,
               :meta_keywords => :text }
    Spree::Store.create_translation_table!(params, { :migrate_data => true })
  end
end
