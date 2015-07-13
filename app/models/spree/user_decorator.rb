module Spree
  User.class_eval do
    def self.csv_columns
      ret = [:login.to_s,:email.to_s,:created_at.to_s]
    end
  end
end
