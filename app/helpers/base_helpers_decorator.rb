def get_google_tag_manager_id
  @gtm = Spree::Tracker.where('gtm_id like ? AND active = ?', "GTM%", true).last
end

def backorder_charge
  return Spree::Config[:backorder_charge]
end