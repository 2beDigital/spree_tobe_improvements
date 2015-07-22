module Spree::Admin
  UsersController.class_eval do
    respond_to :html, :csv
  end
 end