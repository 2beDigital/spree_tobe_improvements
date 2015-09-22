class AddGoogleTagManagerToTrackers < ActiveRecord::Migration
  def change
    add_column  :spree_trackers,  :gtm_id,  :string
  end
end