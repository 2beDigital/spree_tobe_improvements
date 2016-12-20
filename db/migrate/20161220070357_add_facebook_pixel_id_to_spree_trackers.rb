class AddFacebookPixelIdToSpreeTrackers < ActiveRecord::Migration
  def change
    add_column :spree_trackers, :facebook_pixel_id, :string
  end
end
