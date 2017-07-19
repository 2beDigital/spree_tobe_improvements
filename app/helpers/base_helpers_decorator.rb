def get_google_tag_manager_id
  @gtm = Spree::Tracker.where('gtm_id like ? AND active = ?', "GTM%", true).last
end

def get_facebook_pixel_id
  Spree::Tracker.where('facebook_pixel_id <> ? AND active = ?', '', true).last
end

def get_google_analitics_tracker
  Spree::Tracker.where('analytics_id <> ? AND active = ?', '', true).last
end

def backorder_charge
  return Spree::Config[:backorder_charge]
end

def cookies_accepted?
  return false unless request.cookies['accept.cookies'].present?
  true
end

def show_sku
  return Spree::Config[:show_sku]
end

def show_taxes
  return Spree::Config[:show_taxes]
end