module Spree::Admin
  UsersController.class_eval do
    respond_to :html, :csv, :txt
    respond_override :index => {:csv => {:success => lambda{send_data @collection.to_csv}}}
  end
 end