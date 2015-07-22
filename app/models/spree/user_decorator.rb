module Spree
  User.class_eval do
    def self.to_csv()
			all.each do |item|
				csv << item.attributes.values_at(*columnes)
      end
    end
  end
end
