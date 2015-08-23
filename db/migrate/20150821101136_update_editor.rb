class UpdateEditor < ActiveRecord::Migration
  def change
    config = Spree::EditorSetting.new
    config["current_editor"] = "CKEditor"
    config["ids"]="#{config.get_preference("ids")} page_translations_attributes_1_body page_translations_attributes_2_body page_translations_attributes_3_body"
  end
end
