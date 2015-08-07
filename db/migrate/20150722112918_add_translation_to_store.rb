class AddTranslationToStore < ActiveRecord::Migration
  def up
    params = { :name => :string, :seo_title => :string, :meta_description => :text,
               :meta_keywords => :text }
    Spree::Store.create_translation_table!(params, { :migrate_data => true })
  end

  def down
    Spree::Store.drop_translation_table! :migrate_data => true
  end
end
